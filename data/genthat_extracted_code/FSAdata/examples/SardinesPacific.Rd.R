library(FSAdata)


### Name: SardinesPacific
### Title: Stock and recruitment data for Pacific Sardines, 1935-1990.
### Aliases: SardinesPacific
### Keywords: datasets

### ** Examples

data(SardinesPacific)
str(SardinesPacific)
head(SardinesPacific)
op <- par(mfrow=c(1,2),pch=19)
plot(recruits~year,data=SardinesPacific,type="l")
plot(recruits~ssb,data=SardinesPacific)
par(op)




