library(ClassComparison)


### Name: Dudoit-class
### Title: Class "Dudoit"
### Aliases: Dudoit Dudoit-class plot,Dudoit,missing-method
###   cutoffSignificant,Dudoit-method selectSignificant,Dudoit-method
###   countSignificant,Dudoit-method
### Keywords: classes multivariate htest

### ** Examples

showClass("Dudoit")
ng <- 10000
ns <- 15
nd <- 200
fake.class <- factor(rep(c('A', 'B'), each=ns))
fake.data <- matrix(rnorm(ng*ns*2), nrow=ng, ncol=2*ns)
fake.data[1:nd, 1:ns] <- fake.data[1:nd, 1:ns] + 2
fake.data[(nd+1):(2*nd), 1:ns] <- fake.data[(nd+1):(2*nd), 1:ns] - 2

# the permutation test is slow. it really needs many more
# than 10 permutations, but this is just an example...
dud <- Dudoit(fake.data, fake.class, nPerm=10)
summary(dud)
plot(dud)
countSignificant(dud, 0.05)



