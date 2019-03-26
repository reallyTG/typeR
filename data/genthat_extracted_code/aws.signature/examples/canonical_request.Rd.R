library(aws.signature)


### Name: canonical_request
### Title: Construct a Canonical Request
### Aliases: canonical_request

### ** Examples

# From AWS documentation
# http://docs.aws.amazon.com/general/latest/gr/sigv4-create-canonical-request.html
fromDocs <- "POST
/

content-type:application/x-www-form-urlencoded; charset=utf-8
host:iam.amazonaws.com
x-amz-date:20110909T233600Z

content-type;host;x-amz-date
b6359072c78d70ebee1e81adcbab4f01bf2c23245fa365ef83fe8f1f955085e2"

hdrs <- list(`Content-Type` = "application/x-www-form-urlencoded; charset=utf-8",
             Host = "iam.amazonaws.com",
             `x-amz-date` = "20110909T233600Z")
r <- canonical_request(verb = "POST",
                       canonical_uri = "/",
                       query_args = list(),
                       canonical_headers = hdrs,
                       request_body = "Action=ListUsers&Version=2010-05-08")

identical(fromDocs, r$canonical)



