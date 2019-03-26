library(SharpeR)


### Name: as.sr
### Title: Compute the Sharpe ratio.
### Aliases: as.sr as.sr.default as.sr.matrix as.sr.data.frame as.sr.lm
###   as.sr.xts as.sr.timeSeries
### Keywords: univar

### ** Examples

# Sharpe's 'model': just given a bunch of returns.
asr <- as.sr(rnorm(253*3),ope=253)
# or a matrix, with a name
my.returns <- matrix(rnorm(253*3),ncol=1)
colnames(my.returns) <- c("my strategy")
asr <- as.sr(my.returns)
# given an xts object:
## Not run: 
##D if (require(quantmod)) {
##D   IBM <- getSymbols('IBM',auto.assign=FALSE)
##D   lrets <- diff(log(IBM[,"IBM.Adjusted"]))
##D   asr <- as.sr(lrets,na.rm=TRUE)
##D }
## End(Not run)
# on a linear model, find the 'Sharpe' of the residual term
nfac <- 5
nyr <- 10
ope <- 253
set.seed(as.integer(charToRaw("determinstic")))
Factors <- matrix(rnorm(ope*nyr*nfac,mean=0,sd=0.0125),ncol=nfac)
Betas <- exp(0.1 * rnorm(dim(Factors)[2]))
Returns <- (Factors %*% Betas) + rnorm(dim(Factors)[1],mean=0.0005,sd=0.012)
APT_mod <- lm(Returns ~ Factors)
asr <- as.sr(APT_mod,ope=ope)
# try again, but make the Returns independent of the Factors.
Returns <- rnorm(dim(Factors)[1],mean=0.0005,sd=0.012)
APT_mod <- lm(Returns ~ Factors)
asr <- as.sr(APT_mod,ope=ope)

# compute the Sharpe of a bunch of strategies:
my.returns <- matrix(rnorm(253*3*4),ncol=4)
asr <- as.sr(my.returns)  # without sensible colnames?
colnames(my.returns) <- c("strat a","strat b","strat c","strat d")
asr <- as.sr(my.returns)
  



