library(mixtox)


### Name: tuneFit
### Title: Find Optimal Starting values for Curve Fitting
### Aliases: tuneFit
### Keywords: curve fitting goodness of fit trial and error effect
###   concentration

### ** Examples

## example 1
# Fit the non-monotonic concentration-response data
# we'll get a fit with r2 of 0.740
x <- hormesis$OmimCl$x
expr <- hormesis$OmimCl$y
y <- rowMeans(expr)
tuneFit(x, y, eq = 'Biphasic')

## example 2
# Fit the non-monotonic concentration-response data
# use r2 (rsq) of 0.9, we'll get a fit with r2 of 0.989
# calcualte the effect concentration that causes 5% inhibition
x <- hormesis$OmimCl$x
expr <- hormesis$OmimCl$y
y <- rowMeans(expr)
tuneFit(x, y, eq = 'Biphasic', effv = 0.05, rsq = 0.9)

## example 3
# Fit the concentration-response data of heavy metal Ni(2+) on MCF-7 cells.
# Calculate the concentration that causes 5% inhibition on the growth of MCF-7

x <- cytotox$Ni$x
expr <- cytotox$Ni$y
y <- rowMeans(expr)
tuneFit(x, y, eq = 'Logit', effv = 0.05)

## example 4
# Fit the concentration-response data of Paromomycin Sulfate (PAR) on photobacteria.
# Calculate the concentrations that cause 50% inhibition on the growth of photobacteria 

x <- antibiotox$PAR$x
expr <- antibiotox$PAR$y
y <- rowMeans(expr)
tuneFit(x, y, eq = 'Logit', effv = 0.5)



