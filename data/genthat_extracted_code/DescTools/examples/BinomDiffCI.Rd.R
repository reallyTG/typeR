library(DescTools)


### Name: BinomDiffCI
### Title: Confidence Interval for a Difference of Binomials
### Aliases: BinomDiffCI
### Keywords: category

### ** Examples

x1 <- 56; n1 <- 70; x2 <- 48; n2 <- 80
xci <- BinomDiffCI(x1, n1, x2, n2, method=c("wald", "waldcc", "ac", "score",
            "scorecc", "mn", "mee", "blj", "ha"))
Format(xci[,-1], digits=4)

x1 <- 9; n1 <- 10; x2 <- 3; n2 <- 10
yci <- BinomDiffCI(x1, n1, x2, n2, method=c("wald", "waldcc", "ac", "score",
            "scorecc", "mn", "mee", "blj", "ha"))
Format(yci[, -1], digits=4)



