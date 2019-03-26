library(MCPAN)


### Name: summary.binomRDtest
### Title: Detailed print out for binomRDtest
### Aliases: summary.binomRDtest
### Keywords: print

### ** Examples



ntrials <- c(40,20,20,20)
xsuccesses <- c(1,2,2,4)
names(xsuccesses) <- LETTERS[1:4]
test<-binomRDtest(x=xsuccesses, n=ntrials, method="ADD1",
 type="Changepoint", alternative="greater")

test

summary(test)




