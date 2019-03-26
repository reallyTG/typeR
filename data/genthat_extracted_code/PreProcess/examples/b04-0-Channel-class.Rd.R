library(PreProcess)


### Name: Channel-class
### Title: Class "Channel"
### Aliases: Channel-class Channel plot,Channel,missing-method
###   hist,Channel-method summary,Channel-method print,Channel-method
###   show,Channel-method image,Channel-method
### Keywords: classes manip

### ** Examples

showClass("Channel")

## simulate a moderately realistic looking microarray
nc <- 100			# number of rows
nr <- 100			# number of columns
v <- rexp(nc*nr, 1/1000)	# "true" signal intensity (vol)
b <- rnorm(nc*nr, 80, 10)	# background noise
s <- sapply(v-b, max, 1)	# corrected signal intensity (svol)
ct <- ChannelType('user', 'random', nc, nr,  'fake')
raw <- Channel(name='fraud', type=ct, parent='', vec=v)
subbed <- Channel(name='fraud', parent='', type=ct, vec=s)
rm(nc, nr, v, b, s)		# clean some stuff

summary(subbed)
summary(raw)

par(mfrow=c(2,1))
plot(raw)
hist(raw)

par(mfrow=c(1,1))
image(raw)

## finish the cleanup
rm(ct, raw, subbed)



