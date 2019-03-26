library(PreProcess)


### Name: CompleteChannel-class
### Title: Class "CompleteChannel"
### Aliases: CompleteChannel-class CompleteChannel
###   print,CompleteChannel-method show,CompleteChannel-method
###   summary,CompleteChannel-method channelize,CompleteChannel-method
###   plot,CompleteChannel,missing-method image,CompleteChannel-method
###   as.data.frame,CompleteChannel-method analyze,CompleteChannel-method
###   process,CompleteChannel,Processor-method PROC.BACKGROUND PROC.SIGNAL
###   PROC.CORRECTED.SIGNAL PROC.NEG.CORRECTED.SIGNAL PROC.SD.SIGNAL
###   PROC.SIGNAL.TO.NOISE
### Keywords: classes manip

### ** Examples

showClass("CompleteChannel")

## simulate a complete channel object
v <- rexp(10000, 1/1000)
b <- rnorm(10000, 60, 6)
s <- sapply(v-b, function(x) {max(0, x)})
ct <- ChannelType('user', 'random', 100, 100, 'fake')
x <- CompleteChannel(name='fraud', type=ct,
                      data=data.frame(vol=v, bkgd=b, svol=s))
rm(v, b, s, ct)

summary(x)

opar <- par(mfrow=c(2,3))
plot(x)
plot(x, main='Log Scale', useLog=TRUE)
par(opar)

opar <- par(mfrow=c(2,1))
image(x)
par(opar)

b <- process(x, PROC.NEG.CORRECTED.SIGNAL)
summary(b)

q <- process(b, PIPELINE.STANDARD)
summary(q)

q <- process(x, PIPELINE.MDACC.DEFAULT)
summary(q)

## cleanup
rm(x, b, q, opar)



