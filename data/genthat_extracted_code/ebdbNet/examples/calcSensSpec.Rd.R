library(ebdbNet)


### Name: calcSensSpec
### Title: Calculate Sensitivity and Specificity of a Network
### Aliases: calcSensSpec
### Keywords: methods

### ** Examples

library(ebdbNet)
tmp <- runif(1) ## Initialize random number generator
set.seed(16933) ## Set seed
P <- 10 ## 10 genes

## Create artificial true D matrix
Dtrue <- matrix(0, nrow = P, ncol = P)
index <- expand.grid(seq(1:P),seq(1:P))
selected.index <- sample(seq(1:(P*P)), ceiling(0.25 * P * P))
selected.edges <- index[selected.index,]
for(edge in 1:ceiling(0.25 * P * P)) {
	tmp <- runif(1)
	if(tmp > 0.5) {
		Dtrue[selected.edges[edge,1], selected.edges[edge,2]] <-
			runif(1, min = 0.2, max = 1)
	}
	else {
		Dtrue[selected.edges[edge,1], selected.edges[edge,2]] <-
			runif(1, min = -1, max = -0.2)
	}
}

## Create artificial estimated D matrix
Dest <- matrix(0, nrow = P, ncol = P)
index <- expand.grid(seq(1:P),seq(1:P))
selected.index <- sample(seq(1:(P*P)), ceiling(0.25 * P * P))
selected.edges <- index[selected.index,]
for(edge in 1:ceiling(0.25 * P * P)) {
	tmp <- runif(1)
	if(tmp > 0.5) {
		Dest[selected.edges[edge,1], selected.edges[edge,2]] <-
			runif(1, min = 0.2, max = 1)
	}
	else {
		Dest[selected.edges[edge,1], selected.edges[edge,2]] <-
			runif(1, min = -1, max = -0.2)
	}
}

check <- calcSensSpec(Dtrue, Dest)
check$TP ## 5 True Positives
check$FP ## 20 False Positives
check$TN ## 55 True Negatives
check$FN ## 20 False Negatives




