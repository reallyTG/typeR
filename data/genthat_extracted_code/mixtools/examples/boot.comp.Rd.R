library(mixtools)


### Name: boot.comp
### Title: Performs Parametric Bootstrap for Sequentially Testing the
###   Number of Components in Various Mixture Models
### Aliases: boot.comp
### Keywords: file

### ** Examples

## Bootstrapping to test the number of components on the RTdata.

data(RTdata)
set.seed(100)
x <- as.matrix(RTdata[, 1:3])
y <- makemultdata(x, cuts = quantile(x, (1:9)/10))$y
a <- boot.comp(y = y, max.comp = 1, B = 5, mix.type = "multmix", 
               epsilon = 1e-3)
a$p.values




