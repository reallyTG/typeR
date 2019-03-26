library(FatTailsR)


### Name: elevenprobs
### Title: Eleven, Seven, Five Probabilities
### Aliases: elevenprobs sevenprobs fiveprobs

### ** Examples


require(timeSeries)

## DS
DS  <- getDSdata()
for (j in 1:16) { print(round(elevenprobs(DS[[j]]), 6)) }
z   <- cbind(t(sapply(DS, elevenprobs)), sapply(DS, length))
colnames(z) <- c("p1","p2","p3","p.25","p.35","p.50","p.65","p.75","1-p3","1-p2","1-p1","length")
z

## Choose j in 1:16
j   <- 1
X   <- sort(DS[[j]])
leX <- logit(eX <- elevenprobs(X))
lpX <- logit(ppoints(length(X), a = 0))
plot(X, lpX)
abline(h = leX, lty = 3)
mtext(eX, side = 4, at = leX, las = 1, line = -3.3)






