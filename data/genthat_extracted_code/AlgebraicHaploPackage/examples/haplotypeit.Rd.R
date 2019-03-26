library(AlgebraicHaploPackage)


### Name: haplotypeit
### Title: Haplotype a 3 x 3 counting matrix.
### Aliases: haplotypeit
### Keywords: haplotyping

### ** Examples

haplotypeit(4,0,0,0,30,0,0,0,23)
print("##############################")
print("This tests the cubic routine")
haplotypeit(4,0,0,0,30,0,0,0,23)
### Formated of 4 digits
print("Formated of 4 digits")
round(as.numeric(Re(haplotypeit(4,0,0,0,30,0,0,0,23)$A)),digit=4)
round(as.numeric(Re(haplotypeit(4,0,0,0,30,0,0,0,23)$B)),digit=4)
round(as.numeric(Re(haplotypeit(4,0,0,0,30,0,0,0,23)$C)),digit=4)
round(as.numeric(Re(haplotypeit(4,0,0,0,30,0,0,0,23)$D)),digit=4)
### 



