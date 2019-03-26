library(pairwiseCI)


### Name: plot.pairwiseCI
### Title: Plotting the output of pairwiseCI
### Aliases: plot.pairwiseCI
### Keywords: hplot

### ** Examples


data(Oats)

output <- pairwiseCI(yield ~ Block, data=Oats,
 by="nitro",method="Param.diff", control="I")

# default plot for difference methods:
plot(output)

# some small changes:
plot(output, CIvert=TRUE, H0line=c(-2,0,2), H0lty=c(2,1,2))

output <- pairwiseCI(yield ~ Block, data=Oats,
 by="nitro", method="Param.ratio", control="I")

# default plot for ratio methods:
plot(output)

# some small changes:
plot(output, CIvert=FALSE, H0line=c(0.7, 1, 1/0.7),
 H0lty=c(3,2,3))




