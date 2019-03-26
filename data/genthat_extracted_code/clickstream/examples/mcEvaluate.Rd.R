library(clickstream)


### Name: mcEvaluate
### Title: Evaluates the number of occurrences of predicted next clicks
### Aliases: mcEvaluate

### ** Examples

training <- c("User1,h,c,c,p,c,h,c,p,p,c,p,p,o",
              "User2,i,c,i,c,c,c,d",
              "User3,h,i,c,i,c,p,c,c,p,c,c,i,d",
              "User4,c,c,p,c,d")

test <- c("User1,h,h,h,h,c,c,p,p,h,c,p,p,c,p,p,o",
          "User2,i,c,i,c,c,c,d",
          "User4,c,c,c,c,d,c,c,c,c")

csf <- tempfile()
writeLines(training, csf)
trainingCLS <- readClickstreams(csf, header = TRUE)
unlink(csf)

csf <- tempfile()
writeLines(test, csf)
testCLS <- readClickstreams(csf, header = TRUE)
unlink(csf)

mc <- fitMarkovChain(trainingCLS, order = 1)
startPattern <- new("Pattern", sequence = c("c","c")) 
res <- mcEvaluate(mc, startPattern, testCLS)
res



