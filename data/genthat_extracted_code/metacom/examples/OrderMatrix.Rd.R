library(metacom)


### Name: OrderMatrix
### Title: Ordinates interaction matrix
### Aliases: OrderMatrix
### Keywords: ordination

### ** Examples


#define an interaction matrix
data(TestMatrices)
pres3c <- TestMatrices[[6]]

#obtain an ordinated interaction matrix
OrderMatrix(pres3c, scores = 1, outputScores = FALSE)

#obtain site and species scores from reciprocal averaging
OrderMatrix(pres3c, scores = 1, outputScores = TRUE)





