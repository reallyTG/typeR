library(MortCast)


### Name: cokannisto
### Title: Coherent Kannisto Method
### Aliases: cokannisto

### ** Examples

data(mxM, mxF, package = "wpp2017")
country <- "South Africa"
mxm <- subset(mxM, name == country)[,-(1:3)]
mxf <- subset(mxF, name == country)[,-(1:3)]
rownames(mxm) <- rownames(mxf) <- c(0,1, seq(5, 100, by=5))
mxnew <- cokannisto(mxm, mxf)
ages <- as.integer(rownames(mxnew$male))
plot(ages, mxnew$male[,"2095-2100"], type="l", log="y", 
    xlab="age", ylab="mx", col="blue", main=country)
lines(ages, mxnew$female[,"2095-2100"], col="red")
lines(ages, mxnew$male[,"2010-2015"], lty=2, col="blue")
lines(ages, mxnew$female[,"2010-2015"], lty=2, col="red")
legend("bottomright", legend=c("male 2010-2015", "female 2010-2015",
    "male 2095-2100", "female 2095-2100"), bty="n",
    col=rep(c("blue", "red"),2), lty=c(2,2,1,1))




