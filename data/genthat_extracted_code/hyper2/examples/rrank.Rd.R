library(hyper2)


### Name: rrank
### Title: Random ranks
### Aliases: rrank print.rrank

### ** Examples

rrank(100,p=(4:1)/10)

r1 <- rrank(100,p=(4:1)/10)
r2 <- rrank(10,p=(4:1)/10)

H <- order_likelihood(r1)
maxp(H)

H <- H + order_likelihood(r2)
maxp(H)






