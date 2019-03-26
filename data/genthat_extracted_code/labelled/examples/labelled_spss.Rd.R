library(labelled)


### Name: labelled_spss
### Title: Create a labelled vector with SPSS style of missing values.
### Aliases: labelled_spss

### ** Examples

x1 <- labelled_spss(1:10, c(Good = 1, Bad = 8), na_values = c(9, 10))
x1
is.na(x1)
x2 <- labelled_spss(1:10, c(Good = 1, Bad = 8), na_range = c(9, Inf))
x2
is.na(x2)



