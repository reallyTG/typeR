library(EcoGenetics)


### Name: eco.fill_ecogen_with_ecopop
### Title: Importation of ecopop to ecogen
### Aliases: eco.fill_ecogen_with_ecopop

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D 
##D # Example 1: add population data to ecogen object
##D result <- eco.fill_ecogen_with_ecopop(my_ecopop, eco, "pop")
##D 
##D # Example 2: Create ecogen object only with population data
##D out <- ecogen(S = eco[["S"]])
##D out <- eco.fill_ecogen_with_ecopop(my_ecopop, out, "pop")
##D 
##D # add the allele frequency data into the slot C with the function eco.add_popdata_into_ecogen
##D out <- eco.fill_ecogen_with_df(eco, "pop", c(1,2,3,4),  C = my_ecopop[["C"]])
##D 
##D 
##D 
## End(Not run)




