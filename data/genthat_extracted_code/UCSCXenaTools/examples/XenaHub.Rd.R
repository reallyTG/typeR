library(UCSCXenaTools)


### Name: XenaHub
### Title: Generate a XenaHub Object
### Aliases: XenaHub

### ** Examples

## No test: 
#1 query all hosts, cohorts and datasets
xe = XenaHub()
xe
#2 query only TCGA hosts
xe = XenaHub(hostName = "TCGA")
xe
hosts(xe)     # get hosts
cohorts(xe)   # get cohorts
datasets(xe)  # get datasets
samples(xe)   # get samples
## End(No test)



