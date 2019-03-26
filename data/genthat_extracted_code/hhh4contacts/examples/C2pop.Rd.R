library(hhh4contacts)


### Name: C2pop
### Title: Adapt a Contact Matrix to Population Fractions
### Aliases: C2pop

### ** Examples

GROUPING <- c(1, 2, 2, 4, 4, 2)
C <- contactmatrix(grouping = GROUPING)
popBErbyg <- aggregateCountsArray(pop2011, dim = 2, grouping = GROUPING)
popfracs <- prop.table(colSums(popBErbyg))
## adapt 'C' to the given population fractions
Cpop <- C2pop(C, popfracs)
## compare the stationary distributions
compstat <- cbind(before = stationary(C/rowSums(C)), popBE = popfracs,
                  after = stationary(Cpop))
matplot(compstat, type="b", lty=1, ylim=c(0, max(compstat)),
        xlab="age group", ylab="population fraction")
## compare the normalized contact matrices
print(plotC(C/rowSums(C), main="original", at=seq(0,0.6,length.out=17)),
      split=c(1,1,2,1), more=TRUE)
print(plotC(Cpop, main="adapted", at=seq(0,0.6,length.out=17)),
      split=c(2,1,2,1), more=FALSE)



