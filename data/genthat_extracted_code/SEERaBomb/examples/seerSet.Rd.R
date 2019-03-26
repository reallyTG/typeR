library(SEERaBomb)


### Name: seerSet
### Title: Join SEER cancers and PY
### Aliases: seerSet
### Keywords: IO

### ** Examples

## Not run: 
##D  
##D library(SEERaBomb)
##D simSeerSet() # without data, a simulated seerSet
##D #  else, with data ...
##D load("~/data/SEER/mrgd/cancDef.RData") #load in canc
##D load("~/data/SEER/mrgd/popsae.RData") # load in popsae
##D # trim columns
##D library(dplyr)  
##D canc=canc%>%select(-reg,-recno,-agerec,-numprims,-COD,
##D           -age19,-age86,-radiatn,-ICD9,-db,-histo3) 
##D popsae=popsae%>%select(-reg,-db)   
##D seerSet(canc,popsae,Sex="male",ageStart=0,ageEnd=100) 
## End(Not run)



