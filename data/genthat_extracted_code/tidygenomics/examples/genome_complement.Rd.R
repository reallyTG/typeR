library(tidygenomics)


### Name: genome_complement
### Title: Calculates the complement to the intervals covered by the
###   intervals in a data frame. It can optionally take a 'chromosome_size'
###   data frame that contains 2 or 3 columns, the first the names of
###   chromosome and in case there are 2 columns the size or first the
###   start index and lastly the end index on the chromosome.
### Aliases: genome_complement

### ** Examples


library(dplyr)

x1 <- data.frame(id = 1:4, bla=letters[1:4],
                 chromosome = c("chr1", "chr1", "chr2", "chr1"),
                 start = c(100, 200, 300, 400),
                 end = c(150, 250, 350, 450))

genome_complement(x1, by=c("chromosome", "start", "end"))



