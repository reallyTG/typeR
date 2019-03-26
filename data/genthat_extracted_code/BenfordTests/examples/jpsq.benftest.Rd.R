library(BenfordTests)


### Name: jpsq.benftest
### Title: Joenssen's _JP-square_ Test for Benford's Law
### Aliases: jpsq.benftest
### Keywords: htest

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)
#Create a sample satisfying Benford's law
X<-rbenf(n=20)
#Perform Joenssen's \emph{JP-square} Test
#on the sample's first digits using defaults
jpsq.benftest(X)
#p-value = 0.3241



