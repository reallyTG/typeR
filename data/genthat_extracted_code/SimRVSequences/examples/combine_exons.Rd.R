library(SimRVSequences)


### Name: combine_exons
### Title: Combine overlapping exons
### Aliases: combine_exons

### ** Examples

# create a data frame that contains the
# the variables: chrom, exonStart, and exonEnd
exDat <- data.frame(chrom     = c(1, 1, 1, 2, 2, 2),
                    exonStart = c(1, 2, 5, 1, 3, 3),
                    exonEnd   = c(3, 4, 7, 4, 5, 6))

exDat

# supply exDat to combine_exons to combine
# overlapping exon segments
combine_exons(exDat)




