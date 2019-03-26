library(MuViCP)


### Name: ensemble
### Title: Ensemble Objects for Classification
### Aliases: ensemble

### ** Examples

data(cancer)
table(cancer$V2)
colnames(cancer)[1:2] <- c('id', 'type')

cancer.d <- as.matrix(cancer[,3:32])
labs <- cancer$type
test_size <- floor(0.15*nrow(cancer.d))
train <- sample(1:nrow(cancer.d), size = nrow(cancer.d) - test_size)
test <- which(!(1:569 %in% train))
truelabs = labs[test]

e <- ensemble(dat = cancer.d, labs = labs[train], train = train, test =
test, bel.type = 'kde', bel_options = list(coef = 0.90))

##Try more matrices than that in real life!
##Also increase the mc.cores parameter if you have more cores!
e$try.matrices(n = 3, mc.cores = 1)

y <- e$get.bpamats()
length(y)

##Can see results from each projection
##b.1  <- bpamat(mat = y[[1]]$get.mat())
##b.2  <- bpamat(mat = y[[2]]$get.mat())
##b.12b <- combine.bpa.mat.bs(b.1, b.2)
##b.12d <- combine.bpa.mat.ds(b.1, b.2)
##b.12b$get.classify()
##b.12d$get.classify()

##All the results
##b.n <- lapply(y, function(x) x$get.classify())
##allb <- combine.bpa.mat.list.bs(e$get.bpamats())
##alld <- combine.bpa.mat.list.ds(e$get.bpamats())

##fn1 <- function(x)
##    table(truelabs, x$get.classify())

##fn2 <- function(x)
##    {
##        tmp <- table(truelabs, x$get.classify())
##        100 *sum(diag(tmp)) / sum(tmp)
##    }

##fn1(allb)
##fn2(allb)
##fn1(alld)
##fn2(alld)



