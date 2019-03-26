library(gdmp)


### Name: toArray
### Title: Turn Illumina's Genome Studio 'Final Report' file into an array
### Aliases: toArray

### ** Examples


## Read file './Final.Report', located in the current working directory,
## and place the first 4 columns in a data frame.

#d <- read.table("./Final.Report", skip=10)[,1:4]

## Use toArray to turn data read into a matrix

#ga <- toArray(finalRep = d)
#ga[1:6, 4000:4002]

#
#               SNP.4000           SNP.4001           SNP.4002
#Individual.1       "GG"               "CC"               "CC"
#Individual.2       "TG"               "AC"               "CC"
#Individual.3       "TG"               "AA"               "CC"
#Individual.4       "GG"               "AC"               "TC"
#Individual.5       "GG"               "AC"               "CC"
#Individual.6       "GG"               "AA"               "CC"
#



