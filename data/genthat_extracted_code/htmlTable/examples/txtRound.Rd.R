library(htmlTable)


### Name: txtRound
### Title: A convenient rounding function
### Aliases: txtRound txtRound.default txtRound.data.frame txtRound.table
###   txtRound.matrix

### ** Examples

mx <- matrix(c(1, 1.11, 1.25,
               2.50, 2.55, 2.45,
               3.2313, 3, pi),
             ncol = 3, byrow=TRUE)
txtRound(mx, 1)



