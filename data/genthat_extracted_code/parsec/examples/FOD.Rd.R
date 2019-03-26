library(parsec)


### Name: FOD
### Title: Fuzzy First Order Domninance analysis on partial orders
### Aliases: FOD FOD.wprof FFOD FFOD.wprof

### ** Examples

v1 <- as.ordered(c("a", "b", "c", "d"))
v2 <- 1:3
prof <- var2prof(varmod = list(v1 = as.ordered(c("a", "b", "c", "d")), v2 = 1:3))
np <- nrow(prof$profiles)

k <- 10 # number of populations
set.seed(0)
populations <- as.data.frame(lapply(1:k, function(x) round(runif(np)*100)))
rownames(populations) <- rownames(prof$profiles)
names(populations) <- paste0("P", 1:k)

prof
populations

res <- FFOD(profiles = prof, distributions = populations)
res



