### R code from vignette source 'customMethods.Rnw'

###################################################
### code chunk number 1: customMethods.Rnw:51-52
###################################################
library(affy)


###################################################
### code chunk number 2: customMethods.Rnw:59-63
###################################################
normalize.AffyBatch.methods()
bgcorrect.methods()
pmcorrect.methods()
express.summary.stat.methods()


###################################################
### code chunk number 3: customMethods.Rnw:68-71
###################################################
library(affydata)
data(Dilution)
normalize.methods(Dilution)


###################################################
### code chunk number 4: customMethods.Rnw:129-140
###################################################
pmcorrect.subtractmmsometimes <- function(object) {

  ## subtract mm
  mm.subtracted <- pm(object) - mm(object)

  ## find which ones are unwanted and fix them
  invalid <- which(mm.subtracted <= 0)
  mm.subtracted[invalid] <- pm(object)[invalid]

  return(mm.subtracted)
}


###################################################
### code chunk number 5: customMethods.Rnw:144-145
###################################################
upDate.pmcorrect.methods(c(pmcorrect.methods(), "subtractmmsometimes"))


###################################################
### code chunk number 6: customMethods.Rnw:151-167
###################################################
huber <- function (y, k = 1.5, tol = 1e-06) {
    y <- y[!is.na(y)]
    n <- length(y)
    mu <- median(y)
    s <- mad(y)
    if (s == 0) 
        stop("cannot estimate scale: MAD is zero for this sample")
    repeat {
        yy <- pmin(pmax(mu - k * s, y), mu + k * s)
        mu1 <- sum(yy)/n
        if (abs(mu - mu1) < tol * s) 
            break
        mu <- mu1
    }
    list(mu = mu, s = s)
}


###################################################
### code chunk number 7: customMethods.Rnw:173-181
###################################################
computeExprVal.huber <- function(probes) {
  res <- apply(probes, 2, huber)
  mu <- unlist(lapply(res, function(x) x$mu))
  s <- unlist(lapply(res, function(x) x$s))
  return(list(exprs=mu, se.exprs=s))
}

upDate.generateExprSet.methods(c(generateExprSet.methods(), "huber"))


