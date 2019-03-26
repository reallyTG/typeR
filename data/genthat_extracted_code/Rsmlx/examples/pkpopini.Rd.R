library(Rsmlx)


### Name: pkpopini
### Title: Compute initial population PK parameters
### Aliases: pkpopini

### ** Examples

## Not run: 
##D # Create in the working directory a Monolix project for a 1 cpt model with 
##D # lag time, 0 order absorption and linear elimination
##D warf.ini1 <- pkpopini(data=warfarin, param=c("Tlag", "Tk0", "V", "Cl")) 
##D 
##D # Create in directory 'warfarin' a Monolix project called 'warfPK2.mlxtran' 
##D # for a 2 cpt model with 1st order absorption and nonlinear elimination
##D warf.ini3 <- pkpopini(data=warfarin, param=c("ka", "V", "k12", "k21", "Vm", "Km"), 
##D                       new.dir="warfarin", new.project="warfPK2.mlxtran") 
## End(Not run)



