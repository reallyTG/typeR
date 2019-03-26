library(gdmp)


### Name: is.identical
### Title: Check two SNPs for near identity across genotyped samples
### Aliases: is.identical

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

## Check the first 2 SNPs for being identical based
## on a minimum allowed margin of error of 0.5%
is.identical(ga.r[,1], ga.r[,2], allow = .005)
# [1] FALSE

## Create an instance of exactly identical SNP genotypes
ga.r <- cbind(ga.r, ga.r[,1])  # SNP #1 and #101 are exactly identical
is.identical(ga.r[,1], ga.r[,101], allow = 0)
# [1] TRUE

## Create an instance of identical SNP genotypes with a 5% error
ga.r <- cbind(ga.r, ga.r[,1])  # SNP #1 and #101 are 100% identical
ga.r[20,101] <- 2  # a different genotype, to make SNP #1 & #101 only 95% identical
is.identical(ga.r[,1], ga.r[,101]) # use default allow of .005
# [1] FALSE

is.identical(ga.r[,1], ga.r[,101], allow = .05) # allow for a 5% marging of error
# [1] TRUE



