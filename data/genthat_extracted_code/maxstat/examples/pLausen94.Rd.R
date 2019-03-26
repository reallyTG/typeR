library(maxstat)


### Name: pLausen94
### Title: Approximating Maximally Selected Statistics
### Aliases: pLausen94 qLausen94
### Keywords: distribution

### ** Examples


p <- pLausen94(2.5, 20, 0.25, 0.75)

# Lausen 94, page 489

if (round(p, 3) != 0.073) stop("error checking pLausen94")

# the same

p2 <- pLausen94(2.5, 200, 0.25, 0.75, m=seq(from=50, to=150, by=10))

stopifnot(all.equal(round(p,3), round(p2,3)))




