library(fitplc)


### Name: getPx
### Title: Extract Px from fitted objects
### Aliases: getPx getPx.default getPx.manyplcfit

### ** Examples

# A fit
somefit <- fitplc(stemvul, x=50, model="sigmoid")

# Extract P12, P88
# Note NA for upper CI for P88; this is quite common
# and should be interpreted as falling outside the range of the data.
getPx(somefit, x=c(12,88))

# Extract P88 from multiple fitted curves
fits <- fitplcs(stemvul, "Species", boot=FALSE)
getPx(fits, 88)




