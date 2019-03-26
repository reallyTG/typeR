library(gdmp)


### Name: snpSelect
### Title: Select genotyped individuals and SNPs based on call rate,
###   heterozygosity, HW equilibrium, or minor allele frequency.
### Aliases: snpSelect

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

## Exclude individuals with call rates below 85%
dim(snpSelect(ga.r, select.method = "call.rate", call.rate.min = 0.85))
#[1]  15 100

## Exclude SNPs with heterozygosity <= 1%
dim(snpSelect(ga.r, select.method = "heterozygosity", hz.min = 0.01))
#[1] 20 79

## If the difference between expected and observed genotype frequencies
## is > 0.15, exclude the SNP.
dim(snpSelect(ga.r, select.method = "HW.Eq", hz.diff = 0.15))
#[1] 20 29

## Select SNPs with minor allele frequencies greater than 0.5%
dim(snpSelect(ga.r, select.method = "MAF", MAF.min = 0.005))
#[1] 20 79



