library(agricolae)


### Name: strip.plot
### Title: Strip-Plot analysis
### Aliases: strip.plot
### Keywords: models

### ** Examples

# Yield
library(agricolae)
data(huasahuasi)
YIELD<-huasahuasi$YIELD
market <- YIELD$y1da + YIELD$y2da
non_market <- YIELD$y3da
yield <- market + non_market
model<-with(YIELD,strip.plot(block, clon, trt, yield))
out1<-with(YIELD,LSD.test(yield,clon,model$gl.a,model$Ea))
par(mar=c(3,8,1,1),cex=0.8)
plot(out1,xlim=c(0,80),horiz=TRUE,las=1)
out2<-with(YIELD,LSD.test(yield,trt,model$gl.b,model$Eb))
plot(out2,xlim=c(0,80),horiz=TRUE,las=1)



