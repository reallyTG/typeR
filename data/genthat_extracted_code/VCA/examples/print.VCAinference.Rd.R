library(VCA)


### Name: print.VCAinference
### Title: Standard Print Method for Objects of Class 'VCAinference'.
### Aliases: print.VCAinference

### ** Examples

## Not run: 
##D # load data (CLSI EP05-A2 Within-Lab Precision Experiment) 
##D data(dataEP05A2_1)
##D 
##D # perform ANOVA-estimation of variance components for a nested design
##D res <- anovaVCA(y~day/run, Data=dataEP05A2_1)
##D res
##D inf <- VCAinference(res)
##D inf
##D 
##D # show certain parts and extract them invisibly
##D CVmat <- print(inf, what="CV")
##D CVmat
##D 
##D # show numerical values with more digits
##D print(inf, digit=12)
## End(Not run)



