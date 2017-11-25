resource "aws_dynamodb_table" "am1-dynamo-tf-locking" {
  name           = "tf_locking"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    costCenter   = "infra"
    serviceLevel = "prd"
  }
}

resource "aws_s3_bucket" "terraform-statefiles" {
  bucket        = "asgard-terraform-statefiles"
  force_destroy = false
  region        = "${var.aws_region}"

  versioning {
    enabled    = true
    mfa_delete = false
  }

  tags {
    costCenter   = "infra"
    serviceLevel = "prd"
  }
}
