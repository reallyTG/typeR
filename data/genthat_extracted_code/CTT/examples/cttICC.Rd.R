library(CTT)


### Name: cttICC
### Title: Function for producing theoretical and empirical item
###   characteristic curves.
### Aliases: cttICC
### Keywords: misc

### ** Examples


library(CTT)# Example data provided with package
data(CTTdata)
data(CTTkey)

# Scores for each preson 
myScores <- score(CTTdata,CTTkey, output.scored=TRUE)

# ICC for item 1
cttICC(myScores$score, myScores$scored[,1], colTheme="spartans", cex=1.5)



