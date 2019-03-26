library(RMark)


### Name: rerun.mark
### Title: Runs a previous MARK model with new starting values
### Aliases: rerun.mark
### Keywords: model

### ** Examples

## Not run: 
##D # The following example will not run because the data are not included in the
##D # examples.  It illustrates the use of rerun.mark with mark.wrapper.  With this
##D # particular data set the POPAN models were having difficulty converging.  After
##D # running the set of models using mark.wrapper and looking at the results it
##D # was clear that in several instances the model did not converge.  This is easiest
##D # to discern by comparing nested models in the model.table.  If one model 
##D # is nested within another,then the deviance of the model with more
##D # parameters should be as good or better than the smaller model.  If that 
##D # is not the case then the model that converged can be used for initial 
##D # values in a call to rerun.mark for the model that did not converge.
##D #
##D 
##D do.nat=function()
##D {
##D Phi.ageclass=list(formula=~ageclass)
##D Phi.dot=list(formula=~1)
##D p.area=list(formula=~area)
##D p.timebin.plus.area=list(formula=~timebin+area)
##D p.timebin.x.area=list(formula=~-1+timebin:area)
##D pent.ageclass=list(formula=~ageclass)
##D pent.ageclass.plus.EN=list(formula=~ageclass+EN)
##D pent.ageclass.plus.diffEN=list(formula=~ageclass+EN92+EN97+EN02)
##D cml=create.model.list("POPAN")
##D nat=mark.wrapper(cml,data=zc.proc,ddl=zc.ddl,
##D   invisible=FALSE,initial=1,retry=2)
##D return(nat)
##D }
##D nat=do.nat()
##D # model list
##D #            Phi                   p                      pent
##D #1  Phi.ageclass              p.area             pent.ageclass
##D #2  Phi.ageclass              p.area pent.ageclass.plus.diffEN
##D #3  Phi.ageclass              p.area     pent.ageclass.plus.EN
##D #4  Phi.ageclass p.timebin.plus.area             pent.ageclass
##D #5  Phi.ageclass p.timebin.plus.area pent.ageclass.plus.diffEN
##D #6  Phi.ageclass p.timebin.plus.area     pent.ageclass.plus.EN
##D #7  Phi.ageclass    p.timebin.x.area             pent.ageclass
##D #8  Phi.ageclass    p.timebin.x.area pent.ageclass.plus.diffEN
##D #9  Phi.ageclass    p.timebin.x.area     pent.ageclass.plus.EN
##D #10      Phi.dot              p.area             pent.ageclass
##D #11      Phi.dot              p.area pent.ageclass.plus.diffEN
##D #12      Phi.dot              p.area     pent.ageclass.plus.EN
##D #13      Phi.dot p.timebin.plus.area             pent.ageclass
##D #14      Phi.dot p.timebin.plus.area pent.ageclass.plus.diffEN
##D #15      Phi.dot p.timebin.plus.area     pent.ageclass.plus.EN
##D #16      Phi.dot    p.timebin.x.area             pent.ageclass
##D #17      Phi.dot    p.timebin.x.area pent.ageclass.plus.diffEN
##D #18      Phi.dot    p.timebin.x.area     pent.ageclass.plus.EN
##D #
##D # use model 9 as starting values for model 7
##D nat[[7]]= rerun.mark(nat[[7]],data=zc.proc,ddl=zc.ddl,initial=nat[[9]])
##D # use model 3 as starting values for model 1
##D nat[[1]]= rerun.mark(nat[[1]],data=zc.proc,ddl=zc.ddl,initial=nat[[3]])
##D # use model 14 as starting values for model 15
##D nat[[15]]= rerun.mark(nat[[15]],data=zc.proc,ddl=zc.ddl,initial=nat[[14]])
##D # use model 5 as starting values for model 6
##D nat[[6]]= rerun.mark(nat[[6]],data=zc.proc,ddl=zc.ddl,initial=nat[[5]])
##D # use model 10 as starting values for model 11
##D nat[[11]]= rerun.mark(nat[[11]],data=zc.proc,ddl=zc.ddl,initial=nat[[10]])
##D # use model 10 as starting values for model 12
##D nat[[12]]= rerun.mark(nat[[12]],data=zc.proc,ddl=zc.ddl,initial=nat[[10]])
##D # reconstruct model table with new results
##D nat$model.table=model.table(nat[1:18])
##D # show new model table
##D nat
## End(Not run)



