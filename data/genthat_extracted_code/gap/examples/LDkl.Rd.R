library(gap)


### Name: LDkl
### Title: LD statistics for two multiallelic markers
### Aliases: LDkl
### Keywords: models

### ** Examples

## Not run: 
##D # two examples in the C program 2LD:
##D # two SNPs as in 2by2.dat
##D # this can be compared with output from LD22
##D 
##D h <- c(0.442356,0.291532,0.245794,0.020319)
##D n <- 481*2
##D t <- LDkl(2,2,h,n)
##D t
##D 
##D # two multiallelic markers as in kbyl.dat
##D # the two-locus haplotype vector is in file "kbyl.dat"
##D 
##D filespec <- system.file("tests/2ld/kbyl.dat")
##D h <- scan(filespec,skip=1)
##D t <- LDkl(9,5,h,213*2,verbose=TRUE)
## End(Not run)



