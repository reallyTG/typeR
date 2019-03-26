library(clickstream)


### Name: mcEvaluateAll
### Title: Evaluates all next page clicks in a clickstream training data
###   set against a test data
### Aliases: mcEvaluateAll

### ** Examples

training <- c("User1,h,c,c,p,c,h,c,p,p,c,p,p",
              "User2,i,c,i,c,c,c,d")

test <- c("User1,h,c,c,p,c,h,c,d,p,c,d,p",
             "User2,i,c,i,p,c,c,d")

csf <- tempfile()
writeLines(training, csf)
trainingCLS <- readClickstreams(csf, header = TRUE)
unlink(csf)

csf <- tempfile()
writeLines(test, csf)
testCLS <- readClickstreams(csf, header = TRUE)
unlink(csf)

mc <- fitMarkovChain(trainingCLS, order = 2)
mcEvaluateAll(mc, trainingCLS, testCLS)



