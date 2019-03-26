library(FSAdata)


### Name: HalibutPAC
### Title: Stock and recruitment data for Pacific Halibut, 1929-1991.
### Aliases: HalibutPAC
### Keywords: datasets

### ** Examples

data(HalibutPAC)
str(HalibutPAC)
head(HalibutPAC)
op <- par(mfrow=c(1,2),pch=19)
plot(rec~year,data=HalibutPAC,type="l")
plot(rec~ssb,data=HalibutPAC)
par(op)




