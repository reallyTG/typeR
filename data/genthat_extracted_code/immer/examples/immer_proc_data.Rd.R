library(immer)


### Name: immer_proc_data
### Title: Processing Datasets and Creating Design Matrices for Rating Data
### Aliases: immer_proc_data immer_create_design_matrix_formula

### ** Examples

#############################################################################
# EXAMPLE 1: Processing rating data
#############################################################################

data(data.immer01a, package="immer")
dat <- data.immer01a

res <- immer::immer_proc_data( dat=dat[,paste0("k",1:5)], pid=dat$idstud,
             rater=dat$rater)
str(res, max.level=1)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Creating several design matrices for rating data
##D #############################################################################
##D 
##D data(data.ratings1, package="sirt")
##D dat <- data.ratings1
##D resp <- dat[,-c(1,2)]
##D #- redefine the second and third item such that the maximum category score is 2
##D for (vv in c(2,3)){
##D     resp[ resp[,vv] >=2,vv ] <- 2
##D }
##D 
##D #--- process data
##D res0 <- immer::immer_proc_data( dat=resp, pid=dat$idstud,  rater=dat$rater)
##D 
##D #--- rating scale model
##D des1 <- immer::immer_create_design_matrix_formula( itemtable=res0$itemtable,
##D                 formulaA=~ item + step )
##D des1$des
##D 
##D #--- partial scale model
##D des2 <- immer::immer_create_design_matrix_formula( itemtable=res0$itemtable,
##D                 formulaA=~ item + item:step )
##D des2$des
##D 
##D #--- multi-facets Rasch model
##D des3 <- immer::immer_create_design_matrix_formula( itemtable=res0$itemtable,
##D                 formulaA=~ item + item:step + rater )
##D des3$des
##D 
##D #--- polytomous model with quadratic step effects
##D des4 <- immer::immer_create_design_matrix_formula( itemtable=res0$itemtable,
##D                 formulaA=~ item + item:I(step_num^2) )
##D des4$des
## End(Not run)



