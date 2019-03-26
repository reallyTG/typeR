library(wCorr)


### Name: weightedCorr
### Title: Calculates bivariate Pearson, Spearman, polychoric, and
###   polyserial correlation coefficients
### Aliases: weightedCorr

### ** Examples

# run a polyserial correlation
attach(mtcars)
weightedCorr(gear, x=cyl, method="polyserial")
# weight by MPG
weightedCorr(y=gear, x=cyl, method="polyserial", weights=mpg)
# unweight
weightedCorr(y=gear, x=cyl, method="polyserial")

# run a polychoric correlation
weightedCorr(gear, x=cyl, method="polychoric")
# weight by MPG
weightedCorr(y=gear, x=cyl, method="polychoric", weights=mpg)
# unwiehgted
weightedCorr(y=gear, x=cyl, method="polychoric")
detach(mtcars)




