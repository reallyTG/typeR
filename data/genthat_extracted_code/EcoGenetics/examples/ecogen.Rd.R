library(EcoGenetics)


### Name: ecogen
### Title: Creating a new ecogen object
### Aliases: ecogen

### ** Examples

## Not run: 
##D 
##D # Example with G data of class "data.frame", corresponding to
##D # microsatellites of a diploid organism:
##D data(eco.test)
##D eco <- ecogen(XY = coordinates, P = phenotype, G = genotype,
##D E = environment, S = structure)
##D 
##D # Example with G data of class "data.frame", corresponding to a
##D # presence - absence molecular marker:
##D dat <- sample(c(0,1),100,rep = TRUE)
##D dat <- data.frame(matrix(dat,10,10))
##D eco <- ecogen(G = dat, type = "dominant")
##D 
##D 
##D # DINAMIC ASSIGNMENT WITH ACCESSORS AND "[["
##D 
##D eco <- ecogen(XY = coordinates, P = phenotype)
##D eco
##D 
##D ecoslot.G(eco, order.G = TRUE) <- genotype
##D 
##D # this is identical to
##D eco[["G", order.G=TRUE]] <- genotype
##D 
##D ecoslot.E(eco) <- environment
##D 
##D # this is identical to
##D eco[["E"]] <- environment
##D 
##D #----------------------------------------------------------
##D # See additional examples in help("EcoGenetics accessors")
##D #----------------------------------------------------------
##D 
##D # Storing data in the slot OUT
##D 
##D  singers <- c("carlos_gardel", "billie_holiday")
##D  
##D ecoslot.OUT(eco) <- singers
##D  
##D # Storing several datasets
##D 
##D golden.number <- (sqrt(5) + 1) / 2
##D ecoslot.OUT(eco) <- list(singers, golden.number)    # several objects must be passed as a list
##D 
##D # this is identical to:
##D 
##D eco[["OUT"]] <- list(singers, golden.number)
##D 
##D #---------------------------------
##D # Locked and unlocked objects
##D #---------------------------------
##D 
##D is.locked(eco) # check if object is locked
##D 
##D eco[["P"]] <- rbind(eco[["P"]], eco[["P"]]) # invalid 
##D                                             # in locked object
##D 
##D 
##D eco_unlocked <- eco.unlock(eco) #unlocked object
##D eco_unlocked[["P"]]<-rbind(eco[["P"]], eco[["P"]]) # valid now
##D 
##D new_locked <- eco.lock(eco_unlocked) # invalid
##D eco_unlocked[["P"]]<- eco[["P"]]
##D new_locked <- eco.lock(eco_unlocked) # valid now
##D 
## End(Not run)




