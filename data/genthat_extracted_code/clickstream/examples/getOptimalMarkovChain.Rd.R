library(clickstream)


### Name: getOptimalMarkovChain
### Title: Generates the optimal markov chains from a list of markov chains
###   and corresponding clusters
### Aliases: getOptimalMarkovChain

### ** Examples


training <- c("User1,h,c,c,p,c,h,c,p,p,c,p,p,o",
              "User2,i,c,i,c,c,c,d",
              "User3,h,i,c,i,c,p,c,c,p,c,c,i,d",
              "User4,c,c,p,c,d")

test <- c("User1,h,c,c,p,p,h,c,p,p,c,p,p,o",
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

clusters <- clusterClickstreams(trainingCLS, centers = 2)
markovchains <- fitMarkovChains(clusters, order = 1)
startPattern <- new("Pattern", sequence = c("c")) 
mc <- getOptimalMarkovChain(startPattern, markovchains, clusters)
predict(mc, startPattern)



