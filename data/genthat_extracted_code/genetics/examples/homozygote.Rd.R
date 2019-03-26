library(genetics)


### Name: homozygote
### Title: Extract Features of Genotype objects
### Aliases: homozygote heterozygote carrier carrier.genotype allele
###   allele.count allele.names
### Keywords: misc

### ** Examples


example.data   <- c("D/D","D/I","D/D","I/I","D/D","D/D","D/D","D/D","I/I","")
g1  <- genotype(example.data)
g1

heterozygote(g1)
homozygote(g1)

carrier(g1,"D")
carrier(g1,"D",na.rm=TRUE)

# get count of one allele 
allele.count(g1,"D")

# get count of each allele
allele.count(g1)  # equivalent to
allele.count(g1, c("D","I"), any=FALSE)

# get combined count for both alleles
allele.count(g1,c("I","D"))

# get second allele
allele(g1,2)

# get both alleles
allele(g1)




