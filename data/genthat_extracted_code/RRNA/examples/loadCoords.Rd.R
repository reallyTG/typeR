library(RRNA)


### Name: loadCoords
### Title: Loads a coordinate file into a data frame
### Aliases: loadCoords
### Keywords: RNA coord

### ** Examples

### Create a test coordinate file using ct2coord ###
ct=makeCt("((((...(((((((.........)))))))...((((.........))))...))))",
          "AAAAAAAACCCCCCCCAAAGGGGGGGAUUACCCCUCCUUUAAAAGGGUUUUCCCCCCC" 
         )
coord=ct2coord(ct)
### add an id ###
coord$id=1

### write out test file ###
write.table( coord[,c('id','x','y','seq','num','bound')],
             col.names=FALSE,row.names=FALSE,sep=",",file="test.cr"
           )

### Read in the coordinate file ##
input=loadCoords("test.cr")

### Plot the file using RNAPlot ##
RNAPlot(input)



