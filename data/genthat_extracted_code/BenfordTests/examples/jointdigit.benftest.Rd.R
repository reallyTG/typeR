library(BenfordTests)


### Name: jointdigit.benftest
### Title: A Hotelling _T-square_ Type Test for Benford's Law
### Aliases: jointdigit.benftest
### Keywords: htest

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)
#Create a sample satisfying Benford's law
X<-rbenf(n=20)
#Perform  Test
#on the sample's first digits using defaults
jointdigit.benftest(X)
#p-value = 0.648
#Perform  Test
#using only the two largest eigenvalues
jointdigit.benftest(x=X,eigenvalues=1:2)
#p-value = 0.5176
#Perform  Test
#using the kaiser selection criterion
jointdigit.benftest(x=X,eigenvalues="kaiser")
#p-value = 0.682



