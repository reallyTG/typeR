library(prodlim)


### Name: summary.Hist
### Title: Summary of event histories
### Aliases: summary.Hist
### Keywords: survival

### ** Examples


icensFrame <- data.frame(L=c(1,1,3,4,6),R=c(2,NA,3,6,9),event=c(1,1,1,2,2))
with(icensFrame,summary(Hist(time=list(L,R))))




