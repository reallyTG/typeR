library(rsurfer)


### Name: subjectDistributionTable
### Title: Create Subject Distribution Table
### Aliases: subjectDistributionTable

### ** Examples

all <- generaterandomsubjects(1000)
all$Age <- stats::runif(1000,50,80)
all <- addrandomgender(all)
all <- addrandomdiagnosis(all)
subjectDistributionTable(all, "Diagnosis")



