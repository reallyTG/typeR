library(gap)


### Name: mia
### Title: multiple imputation analysis for hap
### Aliases: mia
### Keywords: utilities

### ** Examples

## Not run: 
##D # 4 SNP example, to generate hap.out and assign.out alone
##D data(fsnps)
##D hap(id=fsnps[,1],data=fsnps[,3:10],nloci=4)
##D 
##D # to generate results of imputations
##D control <- hap.control(ss=1,mi=5)
##D hap(id=fsnps[,1],data=fsnps[,3:10],nloci=4,control=control)
##D 
##D # to extract information from the second run above
##D mia(so=1,ns=1,mi=5)
##D file.show("mia.out")
##D 
##D ## commands to check out where the output files are as follows:
##D ## Windows
##D # system("command.com")
##D ## Unix
##D # system("csh")
## End(Not run)



