library(prefmod)


### Name: baseball
### Title: Data (paired comparisons): Baseball Games
### Aliases: baseball
### Keywords: datasets

### ** Examples

# baseball example (Agresti, 2002, p. 437)

# pseudodata for generating a design matrix
d1 <- c(rep(0, 21), 1)
d2 <- c(1, rep(0, 20), 2)
d  <- data.frame(rbind(d1, d2))
names(d) <- c(paste0("v", 1:21), "cov")

# design matrix
des5 <- llbt.design(d, nitems = 7,
    objnames = c("MIL", "DET", "TOR", "NY", "BOS", "CLE", "BAL"),
    cat.scov = "cov")
des5$y  <- baseball
des5$mu <- gl(42, 2)
pos     <- c(rep(1:0, 21), rep(0:1, 21))

# fit model and display results
res5 <- gnm(y ~ MIL+DET+TOR+NY+BOS+CLE+BAL + pos,
    eliminate = mu, data = des5, family = poisson)
w5   <- llbt.worth(res5)
plot(w5)



