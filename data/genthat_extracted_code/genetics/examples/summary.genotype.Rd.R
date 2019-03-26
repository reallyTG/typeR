library(genetics)


### Name: summary.genotype
### Title: Allele and Genotype Frequency from a Genotype or Haplotype
###   Object
### Aliases: summary.genotype print.summary.genotype
### Keywords: misc

### ** Examples


example.data   <- c("D/D","D/I","D/D","I/I","D/D",
                    "D/D","D/D","D/D","I/I","")
g1  <- genotype(example.data)
g1

summary(g1)



