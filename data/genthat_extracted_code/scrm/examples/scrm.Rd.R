library(scrm)


### Name: scrm
### Title: Simulate the evolution of biological sequences
### Aliases: scrm
### Keywords: datagen

### ** Examples

set.seed(789)
# 5 Chromosomes with 100 bases each with recombination and mutation
sum_stats <- scrm('5 1 -r 3.1 100 -t 1.5 -T -L')
str(sum_stats)

# Simulate the site frequency spectrum at 3 loci. For each locus
# 10 Chromosomes of 1Mb length are sampled from two populations with
# migration inbetween.
scrm('10 3 -r 400 1000000 -l 100000 -I 2 4 6 0.5 -t 300 -oSFS')$sfs




