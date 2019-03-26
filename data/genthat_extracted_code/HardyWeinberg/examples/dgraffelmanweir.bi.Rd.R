library(HardyWeinberg)


### Name: dgraffelmanweir.bi
### Title: Calculate Graffelman-Weir exact density for bi-allelic
###   X-chromosomal variant
### Aliases: dgraffelmanweir.bi
### Keywords: distribution

### ** Examples

males <- c(A=392, B=212)
females <- c(AA=275, AB=296, BB=80)
prob <- dgraffelmanweir.bi(males,females)
print(prob)



