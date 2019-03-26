library(nplr)


### Name: summary.nplr
### Title: summaryzing 'nplr' Objects
### Aliases: summary.nplr
### Keywords: datasets

### ** Examples

# Using the PC-3 data
require(nplr)
path <- system.file("extdata", "pc3.txt", package = "nplr")
pc3 <- read.delim(path)
model <- nplr(x = pc3$CONC, y = pc3$GIPROP)
summary(model)



