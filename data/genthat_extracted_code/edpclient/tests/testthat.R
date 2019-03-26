library(testthat)
library(edpclient)

# Globals uses by multiple tests
YAXCATPEOPLE_PMID <- "pm-pdly225iffjtlzqq"
GSS3_PID <- "p-c24kcon3pl4xiph7"
GSS3_PMID <- "pm-ezstu6pmcppn4ghc"
PROFILE <- ifelse(Sys.getenv("TRAVIS") == "true", "default", "testing")
# Delay creating global session so it doesn't get set on CRAN.
delayedAssign("SESS", edp_session(profile = PROFILE))

test_check("edpclient")
