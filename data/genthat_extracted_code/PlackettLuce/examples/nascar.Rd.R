library(PlackettLuce)


### Name: nascar
### Title: Results from 2002 NASCAR Season
### Aliases: nascar
### Keywords: datasets

### ** Examples


# convert orderings to rankings
nascar[1:2, 1:45]
R <- as.rankings(nascar, input = "ordering")
colnames(R) <- attr(nascar, "drivers")
R[1:3, 1:3, as.rankings = FALSE]
R[1:3]

# fit model as in Hunter 2004, excluding drivers that only lose
keep <- seq_len(83)
R2 <- R[, keep]
mod <- PlackettLuce(R2, npseudo = 0)

# show coefficients as in Table 2 of Hunter 2004
avRank <- apply(R, 2, function(x) mean(x[x > 0]))
coefs <- round(coef(mod)[order(avRank[keep])], 2)
head(coefs, 3)
tail(coefs, 3)



