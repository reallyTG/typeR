library(evd)


### Name: gumbel
### Title: The Gumbel Distribution
### Aliases: dgumbel pgumbel qgumbel rgumbel
### Keywords: distribution

### ** Examples

dgumbel(-1:2, -1, 0.5)
pgumbel(-1:2, -1, 0.5)
qgumbel(seq(0.9, 0.6, -0.1), 2, 0.5)
rgumbel(6, -1, 0.5)
p <- (1:9)/10
pgumbel(qgumbel(p, -1, 2), -1, 2)
## [1] 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9



