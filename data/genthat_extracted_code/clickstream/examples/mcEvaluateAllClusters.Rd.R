library(clickstream)


### Name: mcEvaluateAllClusters
### Title: Evaluates all next page clicks in a clickstream training data
###   set against a test data
### Aliases: mcEvaluateAllClusters

### ** Examples

training <- c("User1,h,c,c,p,c,h,c,h,o,p,p,c,p,p,o",
              "User2,i,c,i,c,c,c,o,o,o,i,d",
              "User3,h,i,c,i,c,o,i,p,c,c,p,c,c,i,d",
              "User4,c,c,p,c,d,o,i,h,o,o")

test <- c("User1,h,c,c,p,p,h,o,i,c,p,p,c,p,p,o",
          "User2,i,c,i,c,c,c,d",
          "User4,c,c,c,c,d")

csf <- tempfile()
writeLines(training, csf)
trainingCLS <- readClickstreams(csf, header = TRUE)
unlink(csf)

csf <- tempfile()
writeLines(test, csf)
testCLS <- readClickstreams(csf, header = TRUE)
unlink(csf)

clusters <- clusterClickstreams(trainingCLS, centers = 2, order = 1)
markovchains <- fitMarkovChains(clusters, order = 2)
mcEvaluateAllClusters(markovchains, clusters, testCLS, trainingCLS)



