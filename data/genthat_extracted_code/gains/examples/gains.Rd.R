library(gains)


### Name: gains
### Title: Gains Table for a Vector of Predictions
### Aliases: gains
### Keywords: misc

### ** Examples

data(ciaScores)
with(subset(ciaScores,train==0), 
      gains(actual=CellPhonesPP, predicted=PredOLS, optimal=TRUE))



