library(desirability)


### Name: predict.dMax
### Title: Predict method for desirability functions
### Aliases: predict.dMax predict.dMin predict.dTarget predict.dArb
###   predict.dBox predict.dCategorical predict.dOverall
### Keywords: utilities

### ** Examples

d1 <- dMin(1,3)
d2 <- dTarget(1, 2, 3)
d3 <- dCategorical(c("a" = .1, "b" = .7))
dAll <- dOverall(d1, d2, d3)

outcomes <- data.frame(seq(0, 4, length = 10),
                       seq(0.5, 4.5, length = 10),
                       sample(letters[1:2], 10, replace = TRUE))
names(outcomes) <- c("x1", "x1", "x3")   
  
predict(d1, outcomes[,2])
predict(d2, outcomes[,2])
predict(d3, outcomes[,3])
predict(dAll, outcomes)
predict(dAll, outcomes, all = TRUE)



