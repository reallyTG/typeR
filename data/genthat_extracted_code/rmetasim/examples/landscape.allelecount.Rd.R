library(rmetasim)


### Name: landscape.allelecount
### Title: Calculate allele numbers (frequency in the statistical sense) at
###   each locus in each population
### Aliases: landscape.allelecount
### Keywords: misc

### ** Examples

  exampleland <- landscape.new.example()
  exampleland <- landscape.simulate(exampleland, 4)
  landscape.allelefreq(exampleland,tbl.out=TRUE)
  landscape.allelefreq(exampleland,tbl.out=FALSE)
  rm(exampleland)



