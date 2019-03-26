library(hapassoc)


### Name: hapassoc
### Title: EM algorithm to fit maximum likelihood estimates of trait
###   associations with SNP haplotypes
### Aliases: hapassoc
### Keywords: methods

### ** Examples

data(hypoDat)
example.pre.hapassoc<-pre.hapassoc(hypoDat, 3)

example.pre.hapassoc$initFreq # look at initial haplotype frequencies
#      h000       h001       h010       h011       h100       h101       h110 
#0.25179111 0.26050418 0.23606001 0.09164470 0.10133627 0.02636844 0.01081260 
#      h111 
#0.02148268 


names(example.pre.hapassoc$haploDM)
# "h000"   "h001"   "h010"   "h011"   "h100"   "pooled"

# Columns of the matrix haploDM score the number of copies of each haplotype 
# for each pseudo-individual.

# Logistic regression for a multiplicative odds model having as the baseline 
# group homozygotes '001/001' for the most common haplotype

example.regr <- hapassoc(affected ~ attr + h000+ h010 + h011 + h100 + pooled,
                  example.pre.hapassoc, family=binomial())

# Logistic regression with separate effects for 000 homozygotes, 001 homozygotes 
# and 000/001 heterozygotes

example2.regr <- hapassoc(affected ~ attr + I(h000==2) + I(h001==2) +
                   I(h000==1 & h001==1), example.pre.hapassoc, family=binomial())




