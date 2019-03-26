library(vcfR)


### Name: vcfR2DNAbin
### Title: Convert vcfR to DNAbin
### Aliases: vcfR2DNAbin

### ** Examples

library(ape)
data(vcfR_test)

# Create an example reference sequence.
nucs <- c('a','c','g','t')
set.seed(9)
myRef <- as.DNAbin(matrix(nucs[round(runif(n=20, min=0.5, max=4.5))], nrow=1))

# Recode the POS data for a smaller example.
set.seed(99)
vcfR_test@fix[,'POS'] <- sort(sample(10:20, size=length(getPOS(vcfR_test))))

# Just vcfR
myDNA <- vcfR2DNAbin(vcfR_test)
seg.sites(myDNA)
image(myDNA)

# ref.seq, no start.pos
myDNA <- vcfR2DNAbin(vcfR_test, ref.seq = myRef)
seg.sites(myDNA)
image(myDNA)

# ref.seq, start.pos = 4.
# Note that this is the same as the previous example but the variants are shifted.
myDNA <- vcfR2DNAbin(vcfR_test, ref.seq = myRef, start.pos = 4)
seg.sites(myDNA)
image(myDNA)

# ref.seq, no start.pos, unphased_as_NA = FALSE
myDNA <- vcfR2DNAbin(vcfR_test, unphased_as_NA = FALSE, ref.seq = myRef)
seg.sites(myDNA)
image(myDNA)






