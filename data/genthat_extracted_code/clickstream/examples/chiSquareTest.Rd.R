library(clickstream)


### Name: chiSquareTest
### Title: Calculates the chi-square statistic
### Aliases: chiSquareTest

### ** Examples

clickstreams <- c("User1,h,c,c,p,c,h,c,p,p,c,p,p,o",
                 "User2,i,c,i,c,c,c,d",
                 "User3,h,i,c,i,c,p,c,c,p,c,c,i,d",
                 "User4,c,c,p,c,d")

csf <- tempfile()
writeLines(clickstreams, csf)
cls <- readClickstreams(csf, header = TRUE)
unlink(csf)

mc <- fitMarkovChain(cls)
chiSquareTest(cls, mc)



