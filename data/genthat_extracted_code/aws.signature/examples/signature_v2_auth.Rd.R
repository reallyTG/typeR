library(aws.signature)


### Name: signature_v2_auth
### Title: Signature Version 2
### Aliases: signature_v2_auth

### ** Examples

## Not run: 
##D # examples from:
##D # http://docs.aws.amazon.com/general/latest/gr/signature-version-2.html
##D 
##D true_string <- paste0("GET\n",
##D "elasticmapreduce.amazonaws.com\n",
##D "/\n",
##D "AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE",
##D "&Action=DescribeJobFlows",
##D "&SignatureMethod=HmacSHA256",
##D "&SignatureVersion=2",
##D "&Timestamp=2011-10-03T15%3A19%3A30",
##D "&Version=2009-03-31", collapse = "")
##D true_sig <- "i91nKc4PWAt0JJIdXwz9HxZCJDdiy6cf/Mj6vPxyYIs="
##D 
##D q1 <- 
##D list(Action = "DescribeJobFlows",
##D      Version = "2009-03-31",
##D      AWSAccessKeyId = "AKIAIOSFODNN7EXAMPLE",
##D      SignatureVersion = "2",
##D      SignatureMethod = "HmacSHA256",
##D      Timestamp = "2011-10-03T15:19:30")
##D 
##D sig1 <- 
##D signature_v2_auth(datetime = "2011-10-03T15:19:30",
##D                   service = "elasticmapreduce.amazonaws.com",
##D                   verb = "GET",
##D                   path = "/",
##D                   query_args = q1,
##D                   key = q1$AWSAccessKeyId,
##D                   secret = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY")
##D identical(true_string, sig1$CanonicalRequest)
##D identical(true_sig, sig1$Signature)
##D 
##D # leaving out some defaults
##D q2 <- 
##D list(Action = "DescribeJobFlows",
##D      Version = "2009-03-31",
##D      Timestamp = "2011-10-03T15:19:30")
##D sig2 <- 
##D signature_v2_auth(datetime = "2011-10-03T15:19:30",
##D                   service = "elasticmapreduce.amazonaws.com",
##D                   verb = "GET",
##D                   path = "/",
##D                   query_args = q2,
##D                   key = "AKIAIOSFODNN7EXAMPLE",
##D                   secret = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY")
##D identical(true_string, sig2$CanonicalRequest)
##D identical(true_sig, sig2$Signature)
## End(Not run)



