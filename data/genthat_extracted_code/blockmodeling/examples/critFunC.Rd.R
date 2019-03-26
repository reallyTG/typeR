library(blockmodeling)


### Name: critFunC
### Title: Functions for Generalized blockmodeling for valued networks
### Aliases: critFunC optParC
### Keywords: cluster graphs

### ** Examples

# Generating a simple network corresponding to the simple Sum of squares
# Structural equivalence with blockmodel:
# nul com
# nul nul
n <- 20
net <- matrix(NA, ncol = n, nrow = n)
clu <- rep(1:2, times = c(5, 15))
tclu <- table(clu)
net[clu == 1, clu == 1] <- rnorm(n = tclu[1] * tclu[1], mean = 0, sd = 1)
net[clu == 1, clu == 2] <- rnorm(n = tclu[1] * tclu[2], mean = 4, sd = 1)
net[clu == 2, clu == 1] <- rnorm(n = tclu[2] * tclu[1], mean = 0, sd = 1)
net[clu == 2, clu == 2] <- rnorm(n = tclu[2] * tclu[2], mean = 0, sd = 1)

# Computation of criterion function with the correct partition
res <- critFunC(M = net, clu = clu, approaches = "hom", homFun = "ss", blocks = "com")
res$err # The error is relatively small
res$BM  # The block means are around 0 or 4
plot(res)

# Computation of criterion function with the correct partition and correct pre-specified blockmodel
# Prespecified blockmodel used
# nul com
# nul nul
B <- array(NA, dim = c(1, 1, 2, 2))
B[1, 1, , ] <- "nul"
B[1, 1, 1, 2] <- "com"
B[1, 1, , ]
res <- critFunC(M = net, clu = clu, approaches = "hom", homFun = "ss", blocks = B)
res$err # The error is relatively small
res$IM 
plot(res)

# Computation of criterion function with the correct partition 
# and pre-specified blockmodel with some alternatives
# Prespecified blockmodel used
# nul nul|com
# nul nul
B <- array(NA, dim = c(2, 2, 2))
B[1, , ] <- "nul"
B[2, 1, 2] <- "com"
res <- critFunC(M = net, clu = clu, approaches = "hom", homFun = "ss", blocks = B)
res$err # The error is relatively small
res$IM 
plot(res)

# Computation of criterion function with random partition
clu.rnd <- sample(1:2, size = n, replace = TRUE)
res.rnd <- critFunC(M = net, clu = clu.rnd, approaches = "hom", 
homFun = "ss", blocks = "com")
res.rnd$err # The error is larger
res.rnd$BM  # Random block means
plot(res.rnd)

# Adapt network for Valued blockmodeling with the same model
net[net > 4] <- 4
net[net < 0] <- 0

# Computation of criterion function with the correct partition
res <- critFunC(M = net, clu = clu, approaches = "val", 
blocks = c("nul", "com"), preSpecM = 4)
res$err # The error is relatively small
res$IM 
# The image corresponds to the one used for generation of
# The network
plot(res)

# Computation of criterion function with random partition
res.rnd <- critFunC(M = net, clu = clu.rnd, approaches = "val",
blocks = c("nul", "com"), preSpecM = 4)
res.rnd$err # The error is larger
res.rnd$IM # All blocks are probably nul
plot(res.rnd)



