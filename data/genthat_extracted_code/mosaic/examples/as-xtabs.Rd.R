library(mosaic)


### Name: as.xtabs
### Title: Convert objects to xtabs format
### Aliases: as.xtabs as.xtabs.data.frame as.xtabs.matrix
### Keywords: manipulate

### ** Examples

# example from example(fisher.test)
df <- data.frame( X=c('Tea','Milk'), Tea=c(3,1), Milk=c(1,3) )
xt <- as.xtabs(df, rowvar="Guess", colvar="Truth"); xt
if (require(vcd)) { mosaic(xt) }



