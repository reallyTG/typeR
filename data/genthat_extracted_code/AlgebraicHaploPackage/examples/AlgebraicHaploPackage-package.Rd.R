library(AlgebraicHaploPackage)


### Name: AlgebraicHaploPackage-package
### Title: AlgebraicHaploPackage- The package haplotype a contingency of
###   two pairs of snips of a sample.
### Aliases: AlgebraicHaploPackage-package AlgebraicHaploPackage
### Keywords: package

### ** Examples

print("The second example: \n")
dd=matrix(c(1212, 2, 0, 679, 0,0,75,0,0), byrow=TRUE, nrow=3)
colnames(dd)=c("CC","CT","TT")
rownames(dd)=c("CC","CT","TT")
callhaplotype(dd)
### Check the result of the cubic equation of the second example
print("##############################")
print("Check the result of the cubic equation of the second example: \n")
temp2haplo =as.numeric(t(dd));
t2h=temp2haplo
haplotypeit(t2h[1],t2h[2],t2h[3],t2h[4],t2h[5],t2h[6],t2h[7],t2h[8],t2h[9]);
rm(temp2haplo)
rm(t2h)
### Third example
print("##############################")
print("Third example : \n")
dd3=matrix(c(1030,678,123,1,1,0,0,0,0),ncol=3,byrow=TRUE)
colnames(dd3)=c("AA","AG","GG")
rownames(dd3)=c("CC","CT","TT")
callhaplotype(dd3)
###  Check for alternative solutions
print("##############################")
print("Check for alternative solutions: \n")
temp2haplo =as.numeric(t(dd3));
t2h=temp2haplo;
haplotypeit(t2h[1],t2h[2],t2h[3],t2h[4],t2h[5],t2h[6],t2h[7],t2h[8],t2h[9]);
rm(temp2haplo)
rm(t2h)
print("##############################")
print("##############################")
print("This tests the result of the first example of the article \n")
dd2=matrix(c(4,0,0,0,30,0,0,0,23),ncol=3,byrow=TRUE)
callhaplotype(dd2)
callhaplotype(dd2)/(2*57)
print("##############################")



