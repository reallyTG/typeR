library(lda)


### Name: predictive.distribution
### Title: Compute predictive distributions for fitted LDA-type models.
### Aliases: predictive.distribution
### Keywords: utilities

### ** Examples

## Fit a model (from demo(lda)).
data(cora.documents)
data(cora.vocab)

K <- 10 ## Num clusters
result <- lda.collapsed.gibbs.sampler(cora.documents,
                                      K,  ## Num clusters
                                      cora.vocab,
                                      25,  ## Num iterations
                                      0.1,
                                      0.1) 

## Predict new words for the first two documents
predictions <-  predictive.distribution(result$document_sums[,1:2],
                                        result$topics,
                                        0.1, 0.1)

## Use top.topic.words to show the top 5 predictions in each document.
top.topic.words(t(predictions), 5)

##      [,1]         [,2]      
## [1,] "learning"   "learning"
## [2,] "algorithm"  "paper"   
## [3,] "model"      "problem" 
## [4,] "paper"      "results" 
## [5,] "algorithms" "system"  



