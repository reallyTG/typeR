library(MCPAN)


### Name: binomRDtest
### Title: Simultaneous test for contrasts of independent binomial
###   proportions (in a oneway layout)
### Aliases: binomRDtest binomRDtest.default binomRDtest.table
###   binomRDtest.matrix binomRDtest.formula
### Keywords: htest

### ** Examples


ntrials <- c(40,20,20,20)
xsuccesses <- c(1,2,2,4)
names(xsuccesses) <- LETTERS[1:4]
binomRDtest(x=xsuccesses, n=ntrials, method="ADD1",
 type="Dunnett")

binomRDtest(x=xsuccesses, n=ntrials, method="ADD1",
 type="Williams", alternative="greater")

binomRDtest(x=xsuccesses, n=ntrials, method="ADD2",
 type="Williams", alternative="greater")



