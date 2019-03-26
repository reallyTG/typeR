library(reinsureR)


### Name: apply_treaty
### Title: Claims: apply a treaty
### Aliases: apply_treaty

### ** Examples

c <- data.frame(year = unlist(sapply(2000:2017, function(x) rep(x, rpois(1,3)))))
c$amount <- pmax(rnorm(nrow(c), 200000, 100000), 0)
p <- aggregate(amount ~ year, c, sum)
claims <- claims(c, p)
treaty_1 <- xl(ded = 100000, lim = 20000, aad = 5000,
               aal = 200000, prm = 0.01, rns = 1)
claims <- apply_treaty(claims, treaty_1)




