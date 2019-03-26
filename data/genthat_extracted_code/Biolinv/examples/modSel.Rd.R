library(Biolinv)


### Name: modSel
### Title: Wrapper for function spatSim() which allows use on multiple
###   datasets.
### Aliases: modSel

### ** Examples

data(nzw)
data(frogsEM)  #see EM().
data(frogsLacro)  #see simulacro().

## Not run: 
##D frogsSum<- modSel(WIN= nzw, M0= frogsEM, M2= frogsLacro,
##D  AV= c(2,3,4.5,7.5,11,15,20,25), RAD= seq(0,30000,1000))
##D  
## End(Not run)



