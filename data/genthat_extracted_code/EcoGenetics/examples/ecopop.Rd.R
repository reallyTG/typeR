library(EcoGenetics)


### Name: ecopop
### Title: Creating a new ecopop object
### Aliases: ecopop

### ** Examples

## Not run: 
##D 
##D data(eco.test)
##D 
##D ## Three ways to construct an ecopop object 
##D 
##D ## 1) ecogen to ecopop
##D my_ecopop <- ecogen2ecopop(eco, hier = "pop")
##D 
##D # extracting tables with accessors (double brackets notation)
##D XY_pop <- my_ecopop[["XY"]]
##D P_pop <- my_ecopop[["P"]]
##D AF_pop <- my_ecopop[["AF"]]
##D E_pop <- my_ecopop[["E"]]
##D S_pop <- my_ecopop[["S"]]
##D 
##D ## 2) Creating a new ecopop object
##D my_ecopop2 <- ecopop(XY = XY_pop, P = XY_pop, AF = AF_pop, E = E_pop, 
##D                      S = S_pop,
##D                      ploidy = 2, type = "codominant")
##D 
##D ## 3) From an empty object
##D # new empty object
##D my_ecopop3 <- ecopop(ploidy = 2, type = "codominant")
##D 
##D set slots, using as example the data generated above
##D 
##D my_ecopop3[["XY"]] <- XY_pop # The first assignments initializes the S slot
##D                             # with the row names of the data frame used (XY)
##D my_ecopop3[["P"]] <- P_pop
##D my_ecopop3[["AF", ploidy = 2]] <- AF_pop
##D my_ecopop3[["E"]] <- E_pop
##D my_ecopop3[["S"]] <- S_pop
##D 
##D ## Subsetting by rows:
##D my_ecopop3[1:10]
##D #--------------------------------
##D # Locked and unlocked objects 
##D #--------------------------------
##D 
##D is.locked(my_ecopop) # check if object is locked
##D my_ecopop[["P"]] <- rbind(my_ecopop[["P"]], my_ecopop[["P"]]) # invalid in locked object
##D 
##D my_ecopop_unlocked <- eco.unlock(my_ecopop) #unlocked object
##D my_ecopop_unlocked[["P"]]<-rbind(my_ecopop[["P"]], my_ecopop[["P"]])  # valid now
##D 
##D new_locked <- eco.lock(my_ecopop_unlocked) # invalid
##D my_ecopop_unlocked[["P"]]<- my_ecopop[["P"]]
##D new_locked <- eco.lock(my_ecopop_unlocked) # valid now
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
## End(Not run)




