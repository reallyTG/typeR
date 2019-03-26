library(gdmp)


### Name: arrayAppend
### Title: Append two arrays by adding new data to top array
### Aliases: arrayAppend

### ** Examples


ga.old <- matrix(sample(c(0,1,2,5), size = 30, repl = TRUE), nrow=3, ncol=10,
  dimnames = list(paste("Individual", 1:3, sep="."), paste("SNP", 1:10, sep=".")))

ga <- matrix(sample(c(0,1,2,5), size = 24, repl = TRUE), nrow=3, ncol=8,
dimnames = list(paste("Individual", 4:6, sep="."), paste("SNP", 1:8, sep=".")))

arrayAppend(ga.old, ga)
arrayAppend(ga.old, ga)

#
#             SNP.1 SNP.2 SNP.3 SNP.4 SNP.5 SNP.6 SNP.7 SNP.8 SNP.9 SNP.10
#Individual.1     5     5     0     1     2     1     2     5     1      2
#Individual.2     2     2     2     0     1     1     1     1     2      0
#Individual.3     1     1     5     0     5     5     0     5     5      5
#Individual.4     1     2     1     1     0     2     0     0     5      5
#Individual.5     2     1     2     1     0     1     2     1     5      5
#Individual.6     0     2     0     2     5     0     1     1     5      5
#
#Note that SNP.9 and SNP.10 were added to new data but were assigned the default
#code, 5, for missing values. You should impute all missing values afterwards.
#

#If the order of input matrices is switched, the extra SNPs in the second argument
#will be ignored. This function goes by the SNP list of the first arguement.

arrayAppend(ga, ga.old)

#             SNP.1 SNP.2 SNP.3 SNP.4 SNP.5 SNP.6 SNP.7 SNP.8
#Individual.4     1     2     1     1     0     2     0     0
#Individual.5     2     1     2     1     0     1     2     1
#Individual.6     0     2     0     2     5     0     1     1
#Individual.1     5     5     0     1     2     1     2     5
#Individual.2     2     2     2     0     1     1     1     1
#Individual.3     1     1     5     0     5     5     0     5




