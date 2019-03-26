library(mefa)


### Name: stcs
### Title: Create an Object of Class 'stcs'
### Aliases: stcs is.stcs summary.stcs
### Keywords: manip methods classes

### ** Examples

## General long format data
x <- data.frame(
    sample = paste("Sample", c(1,1,2,2,3,4), sep="."),
    species = c(paste("Species", c(1,1,1,2,3), sep="."),  "zero.pseudo"),
    count = c(1,2,10,3,4,0),
    segment = letters[c(6,13,6,13,6,6)])
x
## Long format as stcs
y <- stcs(x)
y
## Methods
as.stcs(x)
is(y, "stcs")
is(y, "data.frame")
## Effects of arguments
stcs(x, expand = TRUE)
stcs(x, drop.zero = TRUE)
stcs(x, zero.pseudo = "pseudo.secies")
## Input options
stcs(x[,1:2])
stcs(x[,1:3])
stcs(x[,c(1:2,4)])
## The Dolina dataset
data(dol.count)
dol <- stcs(dol.count)
dol
plot(dol)



