library(multicon)


### Name: reQ
### Title: Forced Q-Sort Distribution
### Aliases: reQ
### Keywords: Q-Sort Likert-type ratings

### ** Examples

data(rate.caq)
head(rate.caq)
rowMeans(rate.caq)
caq.dist = c(5,8,12,16,18,16,12,8,5)
caq.reQ = reQ(rate.caq, dist = caq.dist)
head(caq.reQ)
rowMeans(caq.reQ)



