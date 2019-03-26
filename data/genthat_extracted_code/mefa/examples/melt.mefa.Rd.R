library(mefa)


### Name: melt
### Title: Melt (Convert) an Object of Class 'mefa' Into 'stcs'
### Aliases: melt melt.mefa
### Keywords: methods manip

### ** Examples

data(dol.count, dol.samp, dol.taxa)
x <- mefa(stcs(dol.count), dol.samp, dol.taxa)
## Long format with original segments
melt(x)
## Long format with undefined segment
melt(as.mefa(x, segment = FALSE))
## These two are identical
melt(x, "microhab")
melt(x, x$samp$microhab) ## this is a factor
## Using a simple vector as factor
melt(x, as.factor(rbinom(dim(x)[1], 1, 0.5)))
## Interaction
melt(x, c("method", "microhab"))
## From taxa table
melt(x, "familia", by.samp = FALSE)
## Example for non-integer data
y <- x$xtab
y[y > 0] <-  y[y > 0] + 0.123
z <- mefa(y)
melt(z)



