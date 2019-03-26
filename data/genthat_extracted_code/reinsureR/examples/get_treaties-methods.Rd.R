library(reinsureR)


### Name: get_treaties
### Title: Get treaties
### Aliases: get_treaties get_treaties,Claims-method

### ** Examples

c <- data.frame(year = unlist(sapply(2000:2017, function(x) rep(x, rpois(1,3)))))
c$amount <- pmax(rnorm(nrow(c), 200000, 100000), 0)
p <- aggregate(amount ~ year, c, sum)
claims <- claims(c, p)
treaty_1 <- qs(0.8, com = 0.25)
claims <- apply_treaty(claims, treaty_1)
get_treaties(claims)




