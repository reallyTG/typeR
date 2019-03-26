library(plotrix)


### Name: pasteCols
### Title: Paste the columns of a matrix together
### Aliases: pasteCols
### Keywords: misc

### ** Examples

 # create a matrix of the combinations of the first five letters of the
 # alphabet taken two at a time.
 alpha5<-combn(LETTERS[1:5],2,simplify=TRUE)
 pasteCols(alpha5,sep="+")



