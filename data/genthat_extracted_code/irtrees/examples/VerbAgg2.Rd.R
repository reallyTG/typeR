library(irtrees)


### Name: VerbAgg2
### Title: Verbal Aggression Data, Dichotomized Items
### Aliases: VerbAgg2
### Keywords: datasets

### ** Examples

str(VerbAgg2)
mapping <- cbind(c(1,1,1), diag(3))
str(VerbAgg2T <- exogenize(VerbAgg2[,-c(1,2)], mapping,
	endnode=rep(1:3, 8)))



