## load dependencies
library(testthat)
library(qrandom)

## test package separated with filter due to limited Travis-CI build time
test_check('qrandom', filter = "qrandom")
test_check('qrandom', filter = "qrandomunif")
test_check('qrandom', filter = "qrandomnorm")
test_check('qrandom', filter = "qUUID")
test_check('qrandom', filter = "qrandommaxint")
