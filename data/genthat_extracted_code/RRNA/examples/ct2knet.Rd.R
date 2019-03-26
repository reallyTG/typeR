library(RRNA)


### Name: ct2knet
### Title: creates a knet file from a CT file
### Aliases: ct2knet
### Keywords: KnetFold RNA

### ** Examples

pk=makeCt("((((...(((((((.........)))))))...((((.........))))...))))",
          "AAAAAAAACCCCCCCCAAAGGGGGGGAUUACCCCUCCUUUAAAAGGGUUUUCCCCCCC"
         )
pk$bound[pk$pos==20]=42
pk$bound[pk$pos==19]=43
pk$bound[pk$pos==43]=19
pk$bound[pk$pos==42]=20

### Create a CT file for testing ###
write.table(pk[,c(1,4,2,3,6,5)],file="test.ct",row.names=FALSE,col.names=TRUE)

### Convert CT file to Knet ###
out=ct2knet("test.ct",0)



