library(InSilicoVA)


### Name: physician_debias
### Title: Implement physician debias algorithm
### Aliases: physician_debias

### ** Examples


data(RandomPhysician)
head(RandomPhysician[, 1:10])
## Not run: 
##D causelist <- c("Communicable", "TB/AIDS", "Maternal", 
##D                "NCD", "External", "Unknown")
##D phydebias <- physician_debias(RandomPhysician, phy.id = c("rev1", "rev2"), 
##D phy.code = c("code1", "code2"), phylist = paste0("doc", c(1:15)), 
##D causelist = causelist, tol = 0.0001, max.itr = 5000)
##D 
##D # see the first physician's bias matrix
##D round(phydebias$phy.bias[[1]], 2)
## End(Not run)



