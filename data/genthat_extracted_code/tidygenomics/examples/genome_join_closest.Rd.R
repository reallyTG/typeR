library(tidygenomics)


### Name: genome_join_closest
### Title: Join intervals on chromosomes in data frames, to the closest
###   partner
### Aliases: genome_join_closest genome_inner_join_closest
###   genome_left_join_closest genome_right_join_closest
###   genome_full_join_closest genome_semi_join_closest
###   genome_anti_join_closest

### ** Examples


library(dplyr)

x1 <- data.frame(id = 1:4, bla=letters[1:4],
                 chromosome = c("chr1", "chr1", "chr2", "chr2"),
                 start = c(100, 200, 300, 400),
                 end = c(150, 250, 350, 450))

x2 <- data.frame(id = 1:4, BLA=LETTERS[1:4],
                 chromosome = c("chr1", "chr2", "chr2", "chr1"),
                 start = c(140, 210, 400, 300),
                 end = c(160, 240, 415, 320))
j <- genome_intersect(x1, x2, by=c("chromosome", "start", "end"), mode="both")
print(j)



