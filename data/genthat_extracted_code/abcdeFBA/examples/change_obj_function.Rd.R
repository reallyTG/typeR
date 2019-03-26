library(abcdeFBA)


### Name: CHANGE_OBJ_FUNCTION
### Title: CHANGE_OBJ_FUNCTION, a function to change the objective for
###   optimization
### Aliases: 'change objective' 'objective function' CHANGE_OBJ_FUNCTION

### ** Examples

#To change the objective function of the model.
data(Ecoli_core)
ec_new_obj<-CHANGE_OBJ_FUNCTION(11,Ecoli_core,0.5,0.5)
#ec_new_obj will be identical to the Ecoli_core model except that 
#the objective function would change
FBA_solve(ec_new_obj)



