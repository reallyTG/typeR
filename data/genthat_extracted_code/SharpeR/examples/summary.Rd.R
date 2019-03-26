library(SharpeR)


### Name: summary.sr
### Title: Summarize a Sharpe, or (delta) optimal Sharpe object.
### Aliases: summary.sr summary.sropt

### ** Examples

# Sharpe's 'model': just given a bunch of returns.
set.seed(1234)
asr <- as.sr(rnorm(253*3),ope=253)
summary(asr)



