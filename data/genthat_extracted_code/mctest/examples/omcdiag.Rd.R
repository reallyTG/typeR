library(mctest)


### Name: omcdiag
### Title: Overall Multicollinearity Diagnostics Measures
### Aliases: omcdiag
### Keywords: Farrar Chi-Square Red Indicator Condition Number Theil's
###   Indicator Determinent of correlation matrix sum of lambda inverse
###   values

### ** Examples

## Hald Cement data
data(Hald)
x<-Hald[,-1]
y<-Hald[,1]

## all oveall diagnostic measures and eigenvalues with intercept
od<-omcdiag(x,y)

## all oveall diagnostic measures and eigenvalues without intercept
omcdiag(x,y, Inter=FALSE)

## all oveall diagnostic measures and eigenvalues with intercept
## with different determinant and confidence level threshold

omcdiag(x,y, detr=0.001, conf=0.99)

## returns the determinant of correlation matrix |X'X|
omcdiag(x,y)[1]



