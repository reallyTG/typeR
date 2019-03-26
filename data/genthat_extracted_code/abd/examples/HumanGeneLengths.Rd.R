library(abd)


### Name: HumanGeneLengths
### Title: Human Gene Lengths
### Aliases: HumanGeneLengths
### Keywords: datasets

### ** Examples

str(HumanGeneLengths)
histogram(~ gene.length, HumanGeneLengths,
          subset = gene.length < 15000)



