## ----echo=FALSE----------------------------------------------------------
### get knitr just the way we like it

knitr::opts_chunk$set(
  message = FALSE,
  warning = FALSE,
  error = FALSE,
  tidy = FALSE,
  cache = FALSE
)

## ------------------------------------------------------------------------
if (!require("survival")) {
    stop("this vignette requires the survival package")
}
library(homomorpheR)

## ------------------------------------------------------------------------
sampleSize <- c(n1 = 1000, n2 = 500, n3 = 1500)

set.seed(12345)

beta.1 <- -.015; beta.2 <- .2; beta.3 <- .001;

lambdaT <- c(5, 4, 3)
lambdaC <- 2

coxData <- lapply(seq_along(sampleSize),
                  function(i) {
                      sex <- sample(c(0, 1), size = sampleSize[i], replace = TRUE)
                      age <- sample(40:70, size = sampleSize[i], replace = TRUE)
                      bm <- rnorm(sampleSize[i])
                      trueTime <- rweibull(sampleSize[i],
                                           shape = 1,
                                           scale = lambdaT[i] * exp(beta.1 * age + beta.2 * sex + beta.3 * bm ))
                      censoringTime <- rweibull(sampleSize[i],
                                                shape = 1,
                                                scale = lambdaC)
                      time <- pmin(trueTime, censoringTime)
                      event <- (time == trueTime)
                      data.frame(stratum = i,
                                 sex = sex,
                                 age = age,
                                 bm = bm,
                                 time = time,
                                 event = event)
                  })

## ------------------------------------------------------------------------
str(coxData[[1]])

## ------------------------------------------------------------------------
str(coxData[[2]])

## ------------------------------------------------------------------------
str(coxData[[3]])

## ------------------------------------------------------------------------
aggModel <- coxph(formula = Surv(time, event) ~ sex +
                                age + bm + strata(stratum),
                            data = do.call(rbind, coxData))
aggModel

## ------------------------------------------------------------------------
aggModel$loglik

## ------------------------------------------------------------------------
Site <- R6::R6Class("Site",
                    private = list(
                        ## name of the site
                        name = NA,
                        ## only master has this, NA for workers
                        privkey = NA,
                        ## local data
                        data = NA,
                        ## The next site in the communication: NA for master
                        nextSite = NA,
                        ## is this the master site?
                        iAmMaster = FALSE,
                        ## intermediate result variable
                        intermediateResult = NA,
                        ## Control variable for cox regression
                        cph.control = NA
                    ),
                    public = list(
                        count = NA,
                        ## Common denominator for approximate real arithmetic
                        den = NA,
                        ## The public key; everyone has this
                        pubkey = NA,
                        initialize = function(name, data, den) {
                            private$name <- name
                            private$data <- data
                            self$den <- den
                            private$cph.control <- replace(coxph.control(), "iter.max", 0)
                        },
                        setPublicKey = function(pubkey) {
                            self$pubkey <- pubkey
                        },
                        setPrivateKey = function(privkey) {
                            private$privkey <- privkey
                        },
                        ## Make me master
                        makeMeMaster = function() {
                            private$iAmMaster <- TRUE
                        },
                        ## add neg log lik and forward to next site
                        addNLLAndForward = function(beta, enc.offset) {
                            if (private$iAmMaster) {
                                ## We are master, so don't forward
                                ## Just store intermediate result and return
                                private$intermediateResult <- enc.offset
                            } else {
                                ## We are workers, so add and forward
                                ## add negative log likelihood and forward result to next site
                                ## Note that offset is encrypted
                                nllValue <- self$nLL(beta)
                                result.int <- floor(nllValue)
                                result.frac <- nllValue - result.int
                                result.fracnum <- gmp::as.bigq(gmp::numerator(gmp::as.bigq(result.frac) * self$den))
                                pubkey <- self$pubkey
                                enc.result.int <- pubkey$encrypt(result.int)
                                enc.result.fracnum <- pubkey$encrypt(result.fracnum)
                                result <- list(int = pubkey$add(enc.result.int, enc.offset$int),
                                               frac = pubkey$add(enc.result.fracnum, enc.offset$frac))
                                private$nextSite$addNLLAndForward(beta, enc.offset = result)
                            }
                            ## Return a TRUE result for now.
                            TRUE
                        },
                        ## Set the next site in the communication graph
                        setNextSite = function(nextSite) {
                            private$nextSite <- nextSite
                        },
                        ## The negative log likelihood
                            nLL = function(beta) {
                            if (private$iAmMaster) {
                                ## We're master, so need to get result from sites
                                ## 1. Generate a random offset and encrypt it
                                pubkey <- self$pubkey
                                offset <- list(int = random.bigz(nBits = 256),
                                               frac = random.bigz(nBits = 256))
                                enc.offset <- list(int = pubkey$encrypt(offset$int),
                                                   frac = pubkey$encrypt(offset$frac))
                                ## 2. Send off to next site
                                throwaway <- private$nextSite$addNLLAndForward(beta, enc.offset)
                                ## 3. When the call returns, the result will be in
                                ##    the field intermediateResult, so decrypt that.
                                sum <- private$intermediateResult
                                privkey <- private$privkey
                                intResult <- as.double(privkey$decrypt(sum$int) - offset$int)
                                fracResult <- as.double(gmp::as.bigq(privkey$decrypt(sum$frac) - offset$frac) / den)
                                intResult + fracResult
                            } else {
                                ## We're worker, so compute local negative log likelihood
                                tryCatch({
                                    m <- coxph(formula = Surv(time, event) ~ sex + age + bm,
                                                         data = private$data,
                                                         init = beta,
                                                         control = private$cph.control)
                                    -(m$loglik[1])
                                },
                                error = function(e) NA)
                            }
                        })
                    )

## ------------------------------------------------------------------------
keys <- PaillierKeyPair$new(1024) ## Generate new public and private key.
den <- gmp::as.bigq(2)^256  #Our denominator for rational approximations

## ------------------------------------------------------------------------
site1 <- Site$new(name = "Site 1", data = coxData[[1]], den = den)
site2 <- Site$new(name = "Site 2", data = coxData[[2]], den = den)
site3 <- Site$new(name = "Site 3", data = coxData[[3]], den = den)

## ------------------------------------------------------------------------
## Master has no data!
master <- Site$new(name = "Master", data = c(), den = den)
master$makeMeMaster()

## ------------------------------------------------------------------------
site1$setPublicKey(keys$pubkey)
site2$setPublicKey(keys$pubkey)
site3$setPublicKey(keys$pubkey)
master$setPublicKey(keys$pubkey)

## ------------------------------------------------------------------------
master$setPrivateKey(keys$getPrivateKey())

## ------------------------------------------------------------------------
master$setNextSite(site1)
site1$setNextSite(site2)
site2$setNextSite(site3)
site3$setNextSite(master)

## ------------------------------------------------------------------------
library(stats4)
nll <- function(age, sex, bm) master$nLL(c(age, sex, bm))
fit <- mle(nll, start = list(age = 0, sex = 0, bm = 0))

## ------------------------------------------------------------------------
summary(fit)

## ------------------------------------------------------------------------
summary(aggModel)

## ------------------------------------------------------------------------
## -2 Log L
-2 * logLik(fit)

