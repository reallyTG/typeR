library(sdcMicro)


### Name: freqCalc
### Title: Frequencies calculation for risk estimation
### Aliases: freqCalc
### Keywords: manip

### ** Examples


data(francdat)
f <- freqCalc(francdat, keyVars=c(2,4,5,6),w=8)
f
f$freqCalc
f$fk
f$Fk
## with missings:
x <- francdat
x[3,5] <- NA
x[4,2] <- x[4,4] <- NA
x[5,6]  <- NA
x[6,2]  <- NA
f2 <- freqCalc(x, keyVars=c(2,4,5,6),w=8)
cbind(f2$fk, f2$Fk)

## test parameter 'alpha'
f3a <- freqCalc(x, keyVars=c(2,4,5,6), w=8, alpha=1)
f3b <- freqCalc(x, keyVars=c(2,4,5,6), w=8, alpha=0.5)
f3c <- freqCalc(x, keyVars=c(2,4,5,6), w=8, alpha=0.1)
data.frame(fka=f3a$fk, fkb=f3b$fk, fkc=f3c$fk)
data.frame(Fka=f3a$Fk, Fkb=f3b$Fk, Fkc=f3c$Fk)



