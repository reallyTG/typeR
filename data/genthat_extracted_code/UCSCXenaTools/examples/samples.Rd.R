library(UCSCXenaTools)


### Name: samples
### Title: get samples of XenaHub object according to by and how action
###   arguments
### Aliases: samples

### ** Examples

## No test: 
xe = XenaHub(cohorts = "Cancer Cell Line Encyclopedia (CCLE)")
# samples in each dataset, first host
x = samples(xe, by="datasets", how="each")[[1]]
lengths(x)        # data sets in ccle cohort on first (only) host
## End(No test)



