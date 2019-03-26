library(dsa)


### Name: fill_up
### Title: Fill up NAs
### Aliases: fill_up

### ** Examples

a <- b <- daily_sim(n=3)$original
a[c(355,376)] <- NA
a_new <- fill_up(a, b)
all(b==a_new)



