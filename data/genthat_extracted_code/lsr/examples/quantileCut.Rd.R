library(lsr)


### Name: quantileCut
### Title: Cut by quantiles
### Aliases: quantileCut

### ** Examples

### An example illustrating why care is needed ###

dataset <- c( 0,1,2, 3,4,5, 7,10,15 )       # note the uneven spread of data
x <- quantileCut( dataset, 3 )              # cut into 3 equally frequent bins
table(x)                                    # tabulate

# For comparison purposes, here is the behaviour of the more standard cut 
# function when applied to the same data:
y <- cut( dataset, 3 )
table(y)




