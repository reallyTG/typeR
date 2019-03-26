library(EcoGenetics)


### Name: eco.fill_ecogen_with_df
### Title: Importation of data frames to ecogen
### Aliases: eco.fill_ecogen_with_df

### ** Examples


## Not run: 
##D 
##D 
##D data(eco.test)
##D 
##D # create some population data 
##D to_ecopop <- ecogen2ecopop(eco, "pop")
##D XY_pop <- to_ecopop[["XY"]]
##D P_pop <- to_ecopop[["P"]]
##D E_pop <- to_ecopop[["E"]]
##D 
##D # Add only XY data to the ecogen object
##D object_with_pop_data <- eco.fill_ecogen_with_df(eco, "pop", c(1,2,3,4), 
##D                                          XY = XY_pop)
##D                                          
##D # Add all the population data to the ecogen object
##D object_with_pop_data <- eco.fill_ecogen_with_df(eco, "pop", c(1,2,3,4), 
##D                                          XY = XY_pop, P = P_pop, E = E_pop)
##D 
## End(Not run)




