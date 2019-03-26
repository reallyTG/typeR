library(matrixTests)


### Name: oneway
### Title: ONEWAY ANOVA
### Aliases: oneway row_oneway_equalvar col_oneway_equalvar
###   row_oneway_welch col_oneway_welch

### ** Examples

col_oneway_welch(iris[,1:4], iris$Species)
row_oneway_equalvar(t(iris[,1:4]), iris$Species)




