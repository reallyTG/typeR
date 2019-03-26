library(FSAdata)


### Name: WhitefishGSL
### Title: Catch-at-age of Great Slave Lake Whitefish (commercial) by area.
### Aliases: WhitefishGSL
### Keywords: datasets

### ** Examples

data(WhitefishGSL)
str(WhitefishGSL)
head(WhitefishGSL)
op <- par(mfrow=c(3,2),pch=19)
plot(log(area.IE)~age,data=WhitefishGSL)
plot(log(area.II)~age,data=WhitefishGSL)
plot(log(area.IV)~age,data=WhitefishGSL)
plot(log(area.V)~age,data=WhitefishGSL)
plot(log(area.IW)~age,data=WhitefishGSL)
par(op)

# can be reshaped to 'long' format with
## Not run: 
##D library(reshape)
##D WhitefishGSL1 <- melt(WhitefishGSL,id.vars="age")
##D names(WhitefishGSL1) <- c("age","area","number")
## End(Not run)




