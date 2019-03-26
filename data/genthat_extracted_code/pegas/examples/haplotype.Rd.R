library(pegas)


### Name: haplotype
### Title: Haplotype Extraction and Frequencies
### Aliases: haplotype haplotype.DNAbin haplotype.character
###   haplotype.numeric plot.haplotype print.haplotype plot.haplotype
###   sort.haplotype [.haplotype
### Keywords: manip hplot

### ** Examples

## generate some artificial data from 'woodmouse':
data(woodmouse)
x <- woodmouse[sample(15, size = 110, replace = TRUE), ]
(h <- haplotype(x))
## the indices of the individuals belonging to the 1st haplotype:
attr(h, "index")[[1]]
plot(sort(h))
## get the frequencies in a named vector:
setNames(lengths(attr(h, "index")), labels(h))



