library(simboot)


### Name: contrMat
### Title: Contrast Matrices
### Aliases: contrMat
### Keywords: misc

### ** Examples

 n <- c(10,20,30,40)
 names(n) <- paste("group", 1:4, sep="")
 contrMat(n)	# Dunnett is default
 contrMat(n, base = 2)	# use second level as baseline
 contrMat(n, type = "Tukey")
 contrMat(n, type = "Sequen")
 contrMat(n, type = "AVE")
 contrMat(n, type = "Changepoint")
 contrMat(n, type = "Williams")
 contrMat(n, type = "Marcus")
 contrMat(n, type = "McDermott")
 ### Umbrella-protected Williams contrasts, i.e. a sequence of 
 ### Williams-type contrasts with groups of higher order 
 ### stepwise omitted
 contrMat(n, type = "UmbrellaWilliams")
 ### comparison of each group with grand mean of all groups
 contrMat(n, type = "GrandMean")




