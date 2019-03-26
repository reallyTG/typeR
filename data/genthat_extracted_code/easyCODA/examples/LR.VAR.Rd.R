library(easyCODA)


### Name: LR.VAR
### Title: Total logratio variance
### Aliases: LR.VAR
### Keywords: logratio

### ** Examples

data(cups)
# These give identical total logratio variances (weighted, by default)
LR.VAR(CLR(cups))
LR.VAR(LR(cups))
# Summing over all sets of ALRs gives twice the variance
totvar <- 0
for(j in 1:ncol(cups)) totvar <- totvar + LR.VAR(ALR(cups, denom=j))
totvar/2



