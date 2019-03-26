library(clickstream)


### Name: getConsensusClusters
### Title: Generates an optimal set of clusters for a clickstream based on
###   certain constraints
### Aliases: getConsensusClusters

### ** Examples

training <- c("User1,h,c,c,p,c,h,c,p,p,c,p,p,o",
              "User2,i,c,i,c,c,c,d",
              "User3,h,i,c,i,c,p,c,c,p,c,c,i,d",
              "User4,h,c,c,p,p,c,p,p,p,i,p,o",
              "User5,i,h,c,c,p,p,c,p,c,d",
              "User6,i,h,c,c,p,p,c,p,c,o",
              "User7,i,h,c,c,p,p,c,p,c,d",
              "User8,i,h,c,c,p,p,c,p,c,d,o")

test <- c(
    "User1,h,c,c,p,c,h,c,p,p,c,p,p,o",
    "User2,i,c,i,c,c,c,d",
    "User3,h,i,c,i,c,p,c,c,p,c,c,i,d"
)

csf <- tempfile()
writeLines(training, csf)
trainingCLS <- readClickstreams(csf, header = TRUE)
unlink(csf)

csf <- tempfile()
writeLines(test, csf)
testCLS <- readClickstreams(csf, header = TRUE)
unlink(csf)

clusters <- getConsensusClusters(trainingCLS, testCLS, maxIterations=5, 
                         optimalProbMean=0.40, range = 0.70, centresMin = 2, 
                         clusterCentresRange = 0, order = 1, takeHighest = FALSE, 
                         verbose = FALSE)
markovchains <- fitMarkovChains(clusters)
startPattern <- new("Pattern", sequence = c("i", "h", "c", "p"))
mc <- getOptimalMarkovChain(startPattern, markovchains, clusters)
predict(mc, startPattern)



