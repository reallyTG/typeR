library(gdmp)


### Name: GetHCS
### Title: Check SNP genotypes and exclude redundant SNPs
### Aliases: GetHCS

### ** Examples


## Simulate random allele designations for 100 bi-allelic SNPs
set.seed(2016)
desig <- array(sample(c('A','C','G','T'), size = 200, repl = TRUE), dim=c(100, 2))

## Simulate random SNP genotypes for 20 individuals - put them in array format
## '-' indicates an unknown base
ga <- array(0, dim=c(20, 100))
for(i in 1:20)
  for(j in 1:100)
    ga[i, j] <- paste(sample(c(desig[j,],"-"), 2, prob=c(.47, .47, .06), repl=TRUE), collapse='')

## Recode the matrix, place recoded genotypes in ga.r
desig <- data.frame(AlleleA_Forward = factor(desig[,1]), AlleleB_Forward = factor(desig[,2]))
ga.r <- array(5, dim=c(20, 100))
for(i in 1:100) ga.r[,i] <- snpRecode(ga[,i], desig[i,])

## Check all SNP genotypes in ga.r for similarity across individuals
## Allow for a margin of error of 0.5%
GetHCS(ga.r)
#[1] 42 91  # SNPs 42 & 91 are similar to earlier SNPs in the vector, 'Exclude'

## Check SNP genotypes from 1 to 50 for similarity across individuals
GetHCS(ga.r, Exclude=1:50)
#[1] 42




