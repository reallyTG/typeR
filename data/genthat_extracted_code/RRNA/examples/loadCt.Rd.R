library(RRNA)


### Name: loadCt
### Title: Loads a CT file into an R data frame
### Aliases: loadCt
### Keywords: RNA CT

### ** Examples

### Create a CT file with PseudoKnots ###
pk=makeCt("((((...(((((((.........)))))))...((((.........))))...))))",
          "AAAAAAAACCCCCCCCAAAGGGGGGGAUUACCCCUCCUUUAAAAGGGUUUUCCCCCCC"
         )
pk$bound[pk$pos==20]=42
pk$bound[pk$pos==19]=43
pk$bound[pk$pos==43]=19
pk$bound[pk$pos==42]=20

### Create a CT file for testing ###
write.table(pk[,c(1,4,2,3,6,5)],file="test.ct",
            row.names=FALSE,col.names=TRUE)

ctfile=loadCt("test.ct")

### Before using ct2coord you need to remove the pseudo knots ###

l=pseudoKnot(ctfile)
dat=l[[2]]
cd=ct2coord(dat)
RNAPlot(cd)




