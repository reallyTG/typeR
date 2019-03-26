library(DescTools)


### Name: Gumbel
### Title: The Gumbel Distribution
### Aliases: dGumbel pGumbel qGumbel rGumbel
### Keywords: distribution

### ** Examples

dGumbel(-1:2, -1, 0.5)
pGumbel(-1:2, -1, 0.5)
qGumbel(seq(0.9, 0.6, -0.1), 2, 0.5)
rGumbel(6, -1, 0.5)
p <- (1:9)/10
pGumbel(qGumbel(p, -1, 2), -1, 2)
## [1] 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9



