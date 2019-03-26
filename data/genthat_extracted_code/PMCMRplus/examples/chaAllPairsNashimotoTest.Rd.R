library(PMCMRplus)


### Name: chaAllPairsNashimotoTest
### Title: All-Pairs Comparisons for Simply Ordered Mean Ranksums
### Aliases: chaAllPairsNashimotoTest chaAllPairsNashimotoTest.default
###   chaAllPairsNashimotoTest.formula
### Keywords: htest nonparametric

### ** Examples

## Example from Sachs (1997, p. 402)
x <- c(106, 114, 116, 127, 145,
       110, 125, 143, 148, 151,
       136, 139, 149, 160, 174)
g <- gl(3,5)
levels(g) <- c("A", "B", "C")
chackoTest(x , g)
chaAllPairsNashimotoTest(x, g, p.adjust.method = "single-step")



