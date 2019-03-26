library(AlgebraicHaploPackage)


### Name: callhaplotype
### Title: calcultes the cotigency table of the haplotypes
### Aliases: callhaplotype
### Keywords: haplotyping cubic haplotypeit

### ** Examples

print("###########################")
dd2=matrix(c(4,0,0,0,30,0,0,0,23),ncol=3,byrow=TRUE)
callhaplotype(dd2)
callhaplotype(dd2)/(2*57)

### The second example
print("##############################")
print("The second example: \n")
dd=matrix(c(1212, 2, 0, 679, 0,0,75,0,0), byrow=TRUE, nrow=3)
colnames(dd)=c("CC","CT","TT")
rownames(dd)=c("CC","CT","TT")
callhaplotype(dd)
print("##############################")



