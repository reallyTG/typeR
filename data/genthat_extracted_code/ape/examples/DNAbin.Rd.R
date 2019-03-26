library(ape)


### Name: DNAbin
### Title: Manipulate DNA Sequences in Bit-Level Format
### Aliases: DNAbin print.DNAbin [.DNAbin rbind.DNAbin cbind.DNAbin
###   as.matrix.DNAbin c.DNAbin as.list.DNAbin labels.DNAbin
### Keywords: manip

### ** Examples

data(woodmouse)
woodmouse
print(woodmouse, 15, 6)
print(woodmouse[1:5, 1:300], 15, 6)
### Just to show how distances could be influenced by sampling:
dist.dna(woodmouse[1:2, ])
dist.dna(woodmouse[1:3, ])
### cbind and its options:
x <- woodmouse[1:2, 1:5]
y <- woodmouse[2:4, 6:10]
as.character(cbind(x, y)) # gives warning
as.character(cbind(x, y, fill.with.gaps = TRUE))
## Not run: 
##D as.character(cbind(x, y, check.names = FALSE)) # gives an error
## End(Not run)



