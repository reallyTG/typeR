library(lda)


### Name: top.topic.words
### Title: Get the Top Words and Documents in Each Topic
### Aliases: top.topic.words top.topic.documents
### Keywords: utilities

### ** Examples

## From demo(lda).

data(cora.documents)
data(cora.vocab)

K <- 10 ## Num clusters
result <- lda.collapsed.gibbs.sampler(cora.documents,
                                      K,  ## Num clusters
                                      cora.vocab,
                                      25,  ## Num iterations
                                      0.1,
                                      0.1) 

## Get the top words in the cluster
top.words <- top.topic.words(result$topics, 5, by.score=TRUE)

## top.words:
##      [,1]             [,2]        [,3]       [,4]            [,5]      
## [1,] "decision"       "network"   "planning" "learning"      "design"  
## [2,] "learning"       "time"      "visual"   "networks"      "logic"   
## [3,] "tree"           "networks"  "model"    "neural"        "search"  
## [4,] "trees"          "algorithm" "memory"   "system"        "learning"
## [5,] "classification" "data"      "system"   "reinforcement" "systems" 
##      [,6]         [,7]       [,8]           [,9]           [,10]      
## [1,] "learning"   "models"   "belief"       "genetic"      "research" 
## [2,] "search"     "networks" "model"        "search"       "reasoning"
## [3,] "crossover"  "bayesian" "theory"       "optimization" "grant"    
## [4,] "algorithm"  "data"     "distribution" "evolutionary" "science"  
## [5,] "complexity" "hidden"   "markov"       "function"     "supported"



