library(MuViCP)


### Name: bel.builder
### Title: Building Belief Functions
### Aliases: kde_bel.builder knn_bel.builder jit_bel.builder

### ** Examples

##Setting Up
data(cancer)
table(cancer$V2)
colnames(cancer)[1:2] <- c('id', 'type')
cancer.d <- as.matrix(cancer[,3:32])
labs <- cancer$type
test_size <- floor(0.15*nrow(cancer.d))
train <- sample(1:nrow(cancer.d), size = nrow(cancer.d) - test_size)
test <- which(!(1:569 %in% train))
truelabs = labs[test]

projectron <- function(A) cancer.d %*% A

seed <- .Random.seed
F <- projectron(basis_random(30))

##Simple Density Classification
kdebel <- kde_bel.builder(labs = labs[train], test = test, train = train)
x1 <- kdebel(F)
predicted1 <- apply(x1, MARGIN = 2, FUN = function(x) names(which.max(x)))
table(truelabs, predicted1)

##Density Classification Using Nearest Neighbor Information
knnbel <- knn_bel.builder(labs = labs[train], test = test, train =
train, options = list(k = 3, p = FALSE, dist.type = 'euclidean', out = 'var', coef
= 0.90))
x2 <- knnbel(F)
predicted2 <- apply(x2, MARGIN = 2, FUN = function(x) names(which.max(x)))
table(truelabs, predicted2)

##Same as above but now using the Coefficient of Variation for Classification
knnbel2 <- knn_bel.builder(labs = labs[train], test = test, train =
train, options = list(k = 3, p = FALSE, dist.type = 'euclidean', out = 'cv', coef =
0.90))
x3 <- knnbel2(F)
predicted3 <- apply(x3, MARGIN = 2, FUN = function(x) names(which.max(x)))
table(truelabs, predicted3)

##Density Classification Using Jitter & NN Information
jitbel <- jit_bel.builder(labs = labs[train], test = test, train =
train, options = list(k = 3, s = 2, p = FALSE, dist.type = 'euclidean', out =
'var', coef = 0.90))
x4 <- jitbel(F)
predicted4 <- apply(x4, MARGIN = 2, FUN = function(x) names(which.max(x)))
table(truelabs, predicted4)

##Same as above but now using the Coefficient of Variation for Classification
jitbel2 <- jit_bel.builder(labs = labs[train], test = test, train =
train, options = list(k = 3, p = FALSE, dist.type = 'euclidean', out =
'cv', s = 2, coef = 0.90))
x5 <- jitbel2(F)
predicted5 <- apply(x5, MARGIN = 2, FUN = function(x) names(which.max(x)))
table(truelabs, predicted5)




