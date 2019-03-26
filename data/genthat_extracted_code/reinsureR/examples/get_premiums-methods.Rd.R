library(reinsureR)


### Name: get_premiums
### Title: Get premiums
### Aliases: get_premiums get_premiums,Claims-method

### ** Examples

c <- data.frame(year = unlist(sapply(2000:2017, function(x) rep(x, rpois(1,3)))))
c$amount <- pmax(rnorm(nrow(c), 200000, 100000), 0)
p <- aggregate(amount ~ year, c, sum)
claims <- claims(c, p)
get_premiums(claims)




