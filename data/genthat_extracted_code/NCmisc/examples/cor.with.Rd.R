library(NCmisc)


### Name: cor.with
### Title: Simulate a correlated variable
### Aliases: cor.with

### ** Examples

X <- rnorm(10,100,14)
cor.with(X,r=.5) # create a variable correlated .5 with X
cor(X,cor.with(X)) # check the actual correlation
# some variability in the actual correlation, so run 1000 times:
print(mean(replicate(1000,{cor(X,cor.with(X))})))
cor.with(X,preserve=TRUE) # preserve original mean and standard deviation
X[c(4,10)] <- NA # works fine with NAs, but new var will have same missing
cor.with(X,mn=50,st=2) # specify new mean and standard deviation



