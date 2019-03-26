library(analogue)


### Name: distance
### Title: Flexibly calculate dissimilarity or distance measures
### Aliases: distance distance.default distance.join oldDistance
###   oldDistance.default oldDistance.join
### Keywords: multivariate methods

### ** Examples

## simple example using dummy data
train <- data.frame(matrix(abs(runif(200)), ncol = 10))
rownames(train) <- LETTERS[1:20]
colnames(train) <- as.character(1:10)
fossil <- data.frame(matrix(abs(runif(100)), ncol = 10))
colnames(fossil) <- as.character(1:10)
rownames(fossil) <- letters[1:10]

## calculate distances/dissimilarities between train and fossil
## samples
test <- distance(train, fossil)

## using a different coefficient, chi-square distance
test <- distance(train, fossil, method = "chi.distance")

## calculate pairwise distances/dissimilarities for training
## set samples
test2 <- distance(train)

## Using distance on an object of class join
dists <- distance(join(train, fossil))
str(dists)

## calculate Gower's general coefficient for mixed data
## first, make a couple of variables factors

fossil[,4] <- factor(sample(rep(1:4, length = 10), 10))
train[,4] <- factor(sample(rep(1:4, length = 20), 20))
## now fit the mixed coefficient
test3 <- distance(train, fossil, "mixed")

## Example from page 260 of Legendre & Legendre (1998)
x1 <- t(c(2,2,NA,2,2,4,2,6))
x2 <- t(c(1,3,3,1,2,2,2,5))
Rj <- c(1,4,2,4,1,3,2,5) # supplied ranges

1 - distance(x1, x2, method = "mixed", R = Rj)

## note this gives ~0.66 as Legendre & Legendre describe the
## coefficient as a similarity coefficient. Hence here we do
## 1 - Dij here to get the same answer. 



