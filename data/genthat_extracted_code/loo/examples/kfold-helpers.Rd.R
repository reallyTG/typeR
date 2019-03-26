library(loo)


### Name: kfold-helpers
### Title: Helper functions for K-fold cross-validation
### Aliases: kfold-helpers kfold_split_random kfold_split_balanced
###   kfold_split_stratified

### ** Examples

kfold_split_random(K = 5, N = 20)

x <- sample(c(0, 1), size = 200, replace = TRUE, prob = c(0.05, 0.95))
table(x)
ids <- kfold_split_balanced(K = 5, x = x)
table(ids[x == 0])
table(ids[x == 1])

grp <- gl(n = 50, k = 15, labels = state.name)
length(grp)
head(table(grp))

ids_10 <- kfold_split_stratified(K = 10, x = grp)
(tab_10 <- table(grp, ids_10))
print(colSums(tab_10))
all.equal(sum(colSums(tab_10)), length(grp))

ids_9 <- kfold_split_stratified(K = 9, x = grp)
tab_9 <- table(grp, ids_9)
print(colSums(tab_9))
all.equal(sum(colSums(tab_10)), length(grp))




