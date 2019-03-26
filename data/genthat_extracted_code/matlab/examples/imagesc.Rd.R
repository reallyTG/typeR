library(matlab)


### Name: imagesc
### Title: MATLAB imagesc function
### Aliases: imagesc
### Keywords: hplot

### ** Examples

values <- matrix(c(seq(1,  5, by=1),
                   seq(2, 10, by=2),
                   seq(3, 15, by=3)), nrow=3, byrow=TRUE)
imagesc(values, xlab="cols", ylab="rows", col=jet.colors(16))



