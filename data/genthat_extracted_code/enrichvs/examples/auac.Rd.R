library(enrichvs)


### Name: auac
### Title: Function to culculate the Area Under the Accumulation Curve
###   (AUAC)
### Aliases: auac

### ** Examples

x <- rnorm(1000)  # random scores for 1000 compounds
y <- c(rep(1,50), rep(0,950))     # activity labels for "x"
auac(x, y)

data(dud_egfr)
auac(dud_egfr$energy, dud_egfr$label, decreasing=FALSE)



