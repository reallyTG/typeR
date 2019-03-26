library(cepp)


### Name: Olive oil measurements
### Title: Olive oil samples from Italy
### Aliases: olive
### Keywords: datasets

### ** Examples

data(olive)
head(olive)
##Permutation
OlivesT <- as.matrix(olive[, -c(1:2)])
OlivesF <- OlivesT
#You should set.seed here so as to "fix" the benchmark
OlivesF[, 'palmitic']	<- OlivesF[sample(572,572), 'palmitic']
OlivesF[, 'palmitoleic'] <- OlivesF[sample(572,572), 'palmitoleic']
OlivesF[, 'stearic'] 	<- OlivesF[sample(572,572), 'stearic']
OlivesF[, 'oleic'] 	<- OlivesF[sample(572,572), 'oleic']
OlivesF[, 'linoleic'] 	<- OlivesF[sample(572,572), 'linoleic']
OlivesF[, 'linolenic']	<- OlivesF[sample(572,572), 'linolenic']
OlivesF[, 'arachidic']	<- OlivesF[sample(572,572), 'arachidic']
OlivesF[, 'eicosenoic']	<- OlivesF[sample(572,572), 'eicosenoic']
##
oil1 <- pp(r=2, n=50, oth=OlivesF, data=OlivesT, k=2)
##In practice try at least >10 starting values
F1   <- basis_random(8)
##Increase iterations to >2000 for useful results
o1 <- optim(par=F1, fn=oil1, gr=basis_nearby(), method='SANN',
            control=list(fnscale=-1, maxit=50, trace=6))



