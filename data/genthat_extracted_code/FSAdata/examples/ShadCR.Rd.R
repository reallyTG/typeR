library(FSAdata)


### Name: ShadCR
### Title: Ages of American Shad assigned from scales by three readers at
###   two times.
### Aliases: ShadCR
### Keywords: datasets

### ** Examples

data(ShadCR)
str(ShadCR)
head(ShadCR)
op <- par(mfrow=c(2,2),pch=19)
plot(agerA1~agerA2,data=ShadCR)
plot(agerB1~agerB2,data=ShadCR)
plot(agerC1~agerC2,data=ShadCR)
plot(agerA1~agerB1,data=ShadCR)
par(op)



