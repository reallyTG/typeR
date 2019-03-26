library(PlackettLuce)


### Name: pudding
### Title: Paired Comparisons of Chocolate Pudding
### Aliases: pudding
### Keywords: datasets

### ** Examples


# reshape to give one row per unique ranking
nr <- 3*nrow(pudding)
R <- matrix(0, nrow = nr, ncol = 6,
            dimnames = list(NULL, seq_len(6)))
i <- rep(pudding$i, 3)
j <- rep(pudding$j, 3)
R[cbind(seq_len(nr), i)] <- rep(c(1, 2, 1), each = nrow(pudding))
R[cbind(seq_len(nr), j)] <- rep(c(2, 1, 1), each = nrow(pudding))
# weights are frequencies of each ranking
w <- unlist(pudding[c("w_ij", "w_ji", "t_ij")])

# fit Plackett-Luce model: limit iterations to match paper
mod <- PlackettLuce(R, npseudo = 0, weights = w, maxit = 7)



