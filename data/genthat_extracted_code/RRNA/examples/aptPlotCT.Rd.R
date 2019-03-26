library(RRNA)


### Name: aptPlotCT
### Title: RNA secondary structure plotting from CT files
### Aliases: aptPlotCT
### Keywords: RNA CT

### ** Examples

### PseudoKnots ###
pk= makeCt("((((...(((((((.........)))))))...((((.........))))...))))",
          "AAAAAAAACCCCCCCCAAAGGGGGGGAUUACCCCUCCUUUAAAAGGGUUUUCCCCCCC"
         )
pk$bound[pk$pos==20]=42
pk$bound[pk$pos==19]=43
pk$bound[pk$pos==43]=19
pk$bound[pk$pos==42]=20

### Create a CT file for testing ###
write.table(pk[,c(1,4,2,3,6,5)],file="test.ct",row.names=FALSE,col.names=TRUE)

aptPlotCT("test.ct",ticksTF=TRUE,ticks=seq(1,60,by=5),pseudoTF=TRUE,pseudo_nums=c(19,20,43,42))




