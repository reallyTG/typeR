library(parsec)


### Name: plot.rank_stability
### Title: Plot outputs of PARSEC function 'rank_stability.'
### Aliases: plot.rank_stability

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

x <- FFOD(profiles = prof, distributions = populations)

res <- rank_stability(x)
plot(res)



