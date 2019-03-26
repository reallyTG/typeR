library(HardyWeinberg)


### Name: EAFExact
### Title: Exact test for equality of allele frequencies in males and
###   females
### Aliases: EAFExact
### Keywords: htest

### ** Examples

#
# bi-allelic autosomal
#

m <- c(AA=60,AB=96,BB=44) 
f <- c(AA=44,AB=97,BB=59) 
EAFtest <- EAFExact(m,f)

#
# bi-allelic X-chromosomal
#

males   <- c(A=392, B=212)
females <- c(AA=275, AB=296, BB=80)
EAFtest <- EAFExact(males,females,verbose=TRUE)

#
# tri-allelic autosomal
#

males   <- c(AA=20,AB=52,AC=34,BB=17,BC=51,CC=26)
females <- c(AA=28,AB=55,AC=33,BB=18,BC=50,CC=16)
EAFtest <- EAFExact(males,females,verbose=TRUE)

#
# tri-allelic X-chromosomal
#

males   <- c(A=15,B=17,C=24) 
females <- toTriangular(c(AA=4,AB=2,AC=13,BB=6,BC=19,CC=4)) 
EAFtest <- EAFExact(males,females,verbose=TRUE)




