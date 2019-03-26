library(DescTools)


### Name: DenseRank
### Title: Dense Ranks and Percent Ranks
### Aliases: DenseRank PercentRank
### Keywords: univar

### ** Examples

(r1 <- rank(x1 <- c(3, 1, 4, 15, 92)))

x2 <- c(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5)
names(x2) <- letters[1:11]
(r2 <- rank(x2))        # ties are averaged
(r2 <- DenseRank(x2))   # ranks are enumerated

PercentRank(x2)



