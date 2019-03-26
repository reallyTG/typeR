library(subtee)
## "#fail#" marks test cases that should fail (and are commented out by default)

########################################################################
## check if modav does the right thing if some variables are in the
## data-frame but others only in the global environment
set.seed(1)
exdat <- data.frame(y = rnorm(100), trt = rbinom(100, size = 1, prob = 0.5),
                    base = rnorm(100),
                    region = factor(sample(c("US", "EU", "Japan"), 100, replace=TRUE)),
                    respo = factor(rbinom(100, 1, 0.3)))
covdat <- exdat[c("base", "region", "respo")]
csubgr <- subbuild(covdat)
head(csubgr)

dat2 <- data.frame(y=exdat$y)
dat2 <- cbind(dat2, csubgr)
subgr <- colnames(csubgr)
treatment <- exdat$trt
rm(exdat)

## check variable scoping
## y defined in dat2, but treatment only in global environment
bagged(resp = "y", trt = "treatment", subgr = subgr, data = dat2, B = 40)
bagged(resp = "y", trt = "treatment", subgr = subgr[1], data = dat2, B = 40)

########################################################################
## checks on the treatment variable
## "trt" should be a numeric (or integer) 0,1 variable
## all checks below should fail!
## dat2$trt <- factor(treatment)
## bagged(resp = "y", trt = "trt", subgr = subgr, data = dat2)
## trtmnt <- dat2$trt
## dat2$trt <- NULL
## bagged(resp = "y", trt = "trtmnt", subgr = subgr, data = dat2)
## dat2$trt <- (treatment == 1) + 1
## bagged(resp = "y", trt = "trt", subgr = subgr, data = dat2)
## trtmnt <- (treatment == 1) + 10
## bagged(resp = "y", trt = "trtmnt", subgr = subgr, data = dat2)
 
########################################################################
## checks on correct specification of the subgroup covariable
## catch cases where the subgroup contains out only 0s or only 1s, and
## cases where there are not at least 1 patient on treatment and
## control in subgroup and complement
## all checks below should fail!
## dat2$NULLGRP <- rep(0, nrow(dat2))
## bagged(resp = "y", trt = "treatment", subgr = c(subgr, "NULLGRP"), data = dat2)
## dat2$NULLGRP <- rep(1, nrow(dat2))
## bagged(resp = "y", trt = "treatment", subgr = c(subgr, "NULLGRP"), data = dat2)
## dat2$TRT2 <- treatment ## subgroups complete confounded with treatment
## bagged(resp = "y", trt = "treatment", subgr = c(subgr, "TRT2"), data = dat2)
 

## catch cases where the subgroup variable is not a numeric variable
## dat2$NGRP <- factor(rbinom(nrow(dat2), 1, 0.5))
## bagged(resp = "y", trt = "treatment", subgr = c(subgr, "NGRP"), data = dat2)
 
## catch cases where the subgroup variable is not a 0,1 variable
## dat2$NGRP <- rnorm(nrow(dat2))
## bagged(resp = "y", trt = "treatment", subgr = c(subgr, "NGRP"), data = dat2)

########################################################################
## using a subgroup variable in covars and subgr
set.seed(1)
exdat <- data.frame(y = rnorm(100),
                    trt = rbinom(100, size = 1, prob = 0.5),
                    marker = rbinom(100, 1, 0.25),
                    region = factor(sample(c("US", "EU", "Japan"), 100,
                                           replace=TRUE)))
covdat <- exdat[c("region")]
csubgr <- subbuild(covdat)
dat2 <- cbind(exdat, csubgr)
subgr <- c(colnames(csubgr), "marker")
res <- bagged(resp = "y", trt = "trt", subgr = subgr,
             covars=~marker, data = dat2, B = 40)


########################################################################
## using non-standard names with rlm
# generate candidate subgroups using the subbuild function
set.seed(1)
exdat <- data.frame(y = rnorm(100), trt = rbinom(100, size = 1, prob = 0.5),
                    base = rnorm(100),
                    region = factor(sample(c("US", "EU", "Japan"), 100, replace=TRUE)),
                    respo = factor(rbinom(100, 1, 0.3)))
covdat <- exdat[c("base", "region", "respo")]
csubgr <- subbuild(covdat)
head(csubgr)

dat2 <- data.frame(y=exdat$y)
dat2 <- cbind(dat2, csubgr)
subgr <- colnames(csubgr)
colnames(csubgr)
# Check rlm does not give an error if non-standard names are used in subgr
bagged(resp = "y", trt = "treatment", 
      subgr = subgr, data = dat2, fitfunc = "rlm", B = 10)
# Also if added in covars
bagged(resp = "y", trt = "treatment", covars = ~ `base<=-0.334`,
      subgr = subgr, data = dat2, fitfunc = "rlm", B = 10)

