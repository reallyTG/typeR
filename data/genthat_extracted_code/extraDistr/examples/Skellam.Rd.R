library(extraDistr)


### Name: Skellam
### Title: Skellam distribution
### Aliases: Skellam dskellam rskellam
### Keywords: distribution

### ** Examples


x <- rskellam(1e5, 5, 13)
xx <- -40:40
plot(prop.table(table(x)), type = "h")
lines(xx, dskellam(xx, 5, 13), col = "red")




