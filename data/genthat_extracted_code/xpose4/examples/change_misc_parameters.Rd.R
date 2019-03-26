library(xpose4)


### Name: change_misc_parameters
### Title: Functions changing miscellaneous parameter settings in Xpose 4
### Aliases: change_misc_parameters change.cat.cont change.cat.cont<-
###   change.cat.levels change.cat.levels<- change.dv.cat.levels
###   change.dv.cat.levels<- change.miss change.subset get.doc set.doc
### Keywords: methods

### ** Examples


## Not run: 
##D ## xpdb5 is an Xpose data object
##D ## We expect to find the required NONMEM run and table files for run
##D ## 5 in the current working directory
##D xpdb5 <- xpose.data(5)
##D 
##D ## Change default subset
##D xpdb5 <- change.subset(xpdb5)
##D 
##D ## Set documentation field
##D xpdb5 <- set.doc(xpdb5)
##D ## View it
##D view.doc(xpdb5)
##D 
##D ## change the categorical limit for the dv variable
##D change.dv.cat.levels(xpdb5) <- 10
##D 
##D ## change the categorical limit for non DV variables
##D change.cat.levels(xpdb5) <- 2
##D ## or
##D xpdb5 <- change.cat.levels(xpdb5,cat.levels=2)
##D 
##D ## chnage variables from categorical to continuous
##D xpdb5 <- change.cat.cont(xpdb5,to.cat.vec=c("AGE"),to.cont.vec=c("SEX"))
##D xpdb5 <- change.cat.cont(xpdb5,change.type.vec=c("AGE","SEX"))
##D change.cat.cont(xpdb5) <- c("AGE","SEX")
## End(Not run)




