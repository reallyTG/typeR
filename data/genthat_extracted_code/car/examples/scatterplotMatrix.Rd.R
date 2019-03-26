library(car)


### Name: scatterplotMatrix
### Title: Scatterplot Matrices
### Aliases: scatterplotMatrix scatterplotMatrix.formula
###   scatterplotMatrix.default spm
### Keywords: hplot

### ** Examples

scatterplotMatrix(~ income + education + prestige | type, data=Duncan)
scatterplotMatrix(~ income + education + prestige | type, data=Duncan,
    regLine=FALSE, smooth=list(spread=FALSE))
scatterplotMatrix(~ income + education + prestige,
    data=Duncan, id=TRUE, smooth=list(method=gamLine))



