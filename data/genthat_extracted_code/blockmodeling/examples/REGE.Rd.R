library(blockmodeling)


### Name: REGE
### Title: REGE - Algorithms for compiting (dis)similarities in terms of
###   regular equivalnece
### Aliases: REGE REGE.for REGE.nm.for REGE.ow REGE.ow.for REGE.ownm.for
###   REGD.for REGD.ow.for REGE.FC REGE.FC.ow REGD.ne.for REGD.ow.ne.for
###   REGE.ne.for REGE.nm.diag.for REGE.nm.ne.for REGE.ow.ne.for
###   REGE.ownm.diag.for REGE.ownm.ne.for
### Keywords: cluster graphs

### ** Examples

n <- 20
net <- matrix(NA, ncol = n, nrow = n)
clu <- rep(1:2, times = c(5, 15))
tclu <- table(clu)
net[clu == 1, clu == 1] <- 0
net[clu == 1, clu == 2] <- rnorm(n = tclu[1] * tclu[2], mean = 4, sd = 1) * sample(c(0, 1),
   size = tclu[1] * tclu[2], replace = TRUE, prob = c(3/5, 2/5))
net[clu == 2, clu == 1] <- 0
net[clu == 2, clu == 2] <- 0

D <- REGE.for(M = net)$E # Any other REGE function can be used
plot.mat(net, clu = cutree(hclust(d = as.dist(1 - D), method = "ward"),
   k = 2))
# REGE returns similarities, which have to be converted to
# disimilarities

res <- optRandomParC(M = net, k = 2, rep = 10, approaches = "hom", homFun = "ss", blocks = "reg")
plot(res) # Hopefully we get the original partition



