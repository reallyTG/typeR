library(stablelearner)


### Name: stabletree
### Title: Stability Assessment for Tree Learners
### Aliases: stabletree print.stabletree summary.stabletree
###   print.summary.stabletree
### Keywords: regression

### ** Examples


## No test: 
## build a simple tree
library("partykit")
m <- ctree(Species ~ ., data = iris)
plot(m)

## investigate stability
set.seed(0)
s <- stabletree(m, B = 500)
print(s)

## variable selection statistics
summary(s)

## show variable selection proportions
barplot(s)

## illustrate variable selections of replications
image(s)

## graphical cutpoint analysis
plot(s)
## End(No test)




