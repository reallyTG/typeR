library(rstream)


### Name: rstream.resetsubstream-methods
### Title: Methods for Function rstream.resetsubstream and
###   rstream.nextsubstream in Package 'rstream'
### Aliases: rstream.resetsubstream rstream.nextsubstream
###   rstream.resetsubstream-methods rstream.nextsubstream-methods
###   rstream.resetsubstream,rstream-method
###   rstream.nextsubstream,rstream-method
###   rstream.resetsubstream,rstream.mrg32k3a-method
###   rstream.nextsubstream,rstream.mrg32k3a-method
###   rstream.resetsubstream,rstream.lecuyer-method
###   rstream.nextsubstream,rstream.lecuyer-method
### Keywords: methods distribution datagen

### ** Examples

## create a new rstream object (of subclass rstream.mrg32k3a)
s <- new("rstream.mrg32k3a")

## jump to beginning of next substream
rstream.nextsubstream(s)

## generate a sample
x <- rstream.sample(s,10)

## reset substream
rstream.resetsubstream(s)

## the new sample y is identical to x
y <- rstream.sample(s,10)
if (identical(x,y)) print("x and y are identical samples")




