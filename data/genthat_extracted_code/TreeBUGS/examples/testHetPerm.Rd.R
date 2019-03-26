library(TreeBUGS)


### Name: testHetPerm
### Title: Permutation Test of Heterogeneity
### Aliases: testHetPerm

### ** Examples

# generate homogeneous data
# (N=15 participants, M=30 items)
data <- data.frame(id = rep(1:15, each=30),
                   item = rep(1:30, 15))
data$cat <- sample(c("h","cr","m","fa"),15*30,
                   replace = TRUE,
                   prob = c(.7,.3,.4,.6))
head(data)
tree <- list(old = c("h","m"),
             new = c("fa", "cr"))

# test participant homogeneity:
tmp <- testHetPerm(data, tree, rep=200, nCPU=1)
tmp[2:3]



