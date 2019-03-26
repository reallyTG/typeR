library(lme4)


### Name: drop1.merMod
### Title: Drop all possible single fixed-effect terms from a mixed effect
###   model
### Aliases: drop1.merMod
### Keywords: misc

### ** Examples

fm1 <- lmer(Reaction~Days+(Days|Subject),sleepstudy)
## likelihood ratio tests
drop1(fm1,test="Chisq")
## use Kenward-Roger corrected F test, or parametric bootstrap,
## to test the significance of each dropped predictor
if (require(pbkrtest) && packageVersion("pbkrtest")>="0.3.8") {
   KRSumFun <- function(object, objectDrop, ...) {
      krnames <- c("ndf","ddf","Fstat","p.value","F.scaling")
      r <- if (missing(objectDrop)) {
          setNames(rep(NA,length(krnames)),krnames)
      } else {
         krtest <- KRmodcomp(object,objectDrop)
         unlist(krtest$stats[krnames])
      }
      attr(r,"method") <- c("Kenward-Roger via pbkrtest package")
      r
   }
   drop1(fm1,test="user",sumFun=KRSumFun)

   if(lme4:::testLevel() >= 3) { ## takes about 16 sec
     nsim <- 100
     PBSumFun <- function(object, objectDrop, ...) {
	pbnames <- c("stat","p.value")
	r <- if (missing(objectDrop)) {
	    setNames(rep(NA,length(pbnames)),pbnames)
	} else {
	   pbtest <- PBmodcomp(object,objectDrop,nsim=nsim)
	   unlist(pbtest$test[2,pbnames])
	}
	attr(r,"method") <- c("Parametric bootstrap via pbkrtest package")
	r
     }
     system.time(drop1(fm1,test="user",sumFun=PBSumFun))
   }
}
## workaround for creating a formula in a separate environment
createFormula <- function(resp, fixed, rand) {  
    f <- reformulate(c(fixed,rand),response=resp)
    ## use the parent (createModel) environment, not the
    ## environment of this function (which does not contain 'data')
    environment(f) <- parent.frame()
    f
}
createModel <- function(data) {
    mf.final <- createFormula("Reaction", "Days", "(Days|Subject)")
    lmer(mf.final, data=data)
}
drop1(createModel(data=sleepstudy))



