library(clickstream)


### Name: predict,MarkovChain-method
### Title: Predicts the Next Click(s) of a User
### Aliases: predict,MarkovChain-method
### Keywords: methods

### ** Examples


# fitting a simple Markov chain and predicting the next click
clickstreams <- c("User1,h,c,c,p,c,h,c,p,p,c,p,p,o",
               "User2,i,c,i,c,c,c,d",
               "User3,h,i,c,i,c,p,c,c,p,c,c,i,d",
               "User4,c,c,p,c,d",
               "User5,h,c,c,p,p,c,p,p,p,i,p,o",
               "User6,i,h,c,c,p,p,c,p,c,d")
csf <- tempfile()
writeLines(clickstreams, csf)
cls <- readClickstreams(csf, header = TRUE)
mc <- fitMarkovChain(cls)
startPattern <- new("Pattern", sequence = c("h", "c"))
predict(mc, startPattern)
#
# predict with predefined absorbing probabilities
#
startPattern <- new("Pattern", sequence = c("h", "c"),
        absorbingProbabilities = data.frame(d = 0.2, o = 0.8))
predict(mc, startPattern)




