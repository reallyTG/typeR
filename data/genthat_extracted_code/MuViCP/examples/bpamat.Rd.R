library(MuViCP)


### Name: bpamat
### Title: Matrices of Basic Probability Assignment Objects
### Aliases: bpamat print.bpamat

### ** Examples

data(cancer)
table(cancer$V2)
colnames(cancer)[1:2] <- c('id', 'type')

cancer.d <- as.matrix(cancer[,3:32])
labs <- cancer$type
test_size <- floor(0.15*nrow(cancer.d))
train <- sample(1:nrow(cancer.d), size = nrow(cancer.d) - test_size)
test <- which(!(1:569 %in% train))
truelabs <- labs[test]

projectron <- function(A)
    cancer.d %*% A

kdebel <- kde_bel.builder(labs = labs[train], test = test, train =
train)

##A projection
seed1 <- .Random.seed
F1 <- projectron(basis_random(30))
x1 <- kdebel(F1)
y1 <- bpamat(info = seed1, mat = x1)
y1
predicted1 <- y1$get.classify()
table(truelabs, predicted1)

##Another projection
seed2 <- .Random.seed
F2 <- projectron(basis_random(30))
x2 <- kdebel(F2)
y2 <- bpamat(info = seed2, mat = x2)
y2
predicted2 <- y2$get.classify()
table(truelabs, predicted2)

z1 <- combine.bpamat.bs(y1, y2)
z2 <- combine.bpamat.ds(y1, y2)
table(truelabs, z1$get.classify())
table(truelabs, z2$get.classify())

##Same result
w1 <- combine.bpamat.list.bs(list(y1, y2))
w2 <- combine.bpamat.list.ds(list(y1, y2))



