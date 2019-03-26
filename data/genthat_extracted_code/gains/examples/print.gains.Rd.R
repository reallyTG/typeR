library(gains)


### Name: print.gains
### Title: Printing Gains Table Objects
### Aliases: print.gains
### Keywords: misc

### ** Examples

data(ciaScores)
print(with(subset(ciaScores,train==0), 
      gains(actual=CellPhonesPP, predicted=PredOLS, optimal=TRUE)),digits=2)



