library(baseline)


### Name: baselineAlgorithmsGUI
### Title: List of available baseline algorithms for GUI function
### Aliases: baselineAlgorithmsGUI
### Keywords: baseline

### ** Examples

## Get a list of all algorithms:
names(baselineAlgorithmsGUI)
## Add new algorithm:
baselineAlgorithmsGUI$my.alg <- as.data.frame(matrix(c(0,20,1,1, 0,20,1,1), 2,4, byrow=TRUE))
dimnames(baselineAlgorithmsGUI$my.alg) <- list(par=c("kappa", "gamma"),
	val=c("min","max","step","default"))
baselineAlgorithmsGUI$my.alg$current <- c(1,1)
baselineAlgorithmsGUI$my.alg$name <- c("Subtractive constand", "Additive constant")



