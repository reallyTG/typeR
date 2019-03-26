library(MortCast)


### Name: kannisto
### Title: Kannisto Method
### Aliases: kannisto

### ** Examples

data(mxM, package = "wpp2017")
mx <- subset(mxM, name == "Burkina Faso")[,-(1:3)]
rownames(mx) <- c(0,1, seq(5, 100, by=5))
mxnew <- kannisto(mx)
ages <- as.integer(rownames(mxnew))
plot(ages, mxnew[,"2095-2100"], type="l", log="y", 
    xlab="age", ylab="mx", col="red")
lines(ages, mxnew[,"2010-2015"])




