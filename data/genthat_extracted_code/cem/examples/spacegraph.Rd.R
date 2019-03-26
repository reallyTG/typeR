library(cem)


### Name: spacegraph
### Title: Randomly compute many different matching solutions
### Aliases: spacegraph
### Keywords: datagen

### ** Examples

## Not run: 
##D data(LL)
##D 
##D sp <- spacegraph("treated", LL, drop="re78", M=5,
##D                   R=list(cem=5,psm=5, mdm=5))
##D 
##D plot(sp)
##D ## ABOUT THE PLOTTING TOOL:
##D ## The circled solution is the current selection.
##D ## Solutions that are strictly better are also circled.
##D ## The gui provides the exact call to re-run the selected matching solution.
##D ## The call can also be edited, re-run by clicking the button, and 
##D ## automatically added to the existing spacegraph.
##D ## CEM solutions can also be adjusted variable by variable and re-run.
##D 
##D 
##D ## Some plotting parameters can be changed
##D plot(sp, main="Comparison of Matching Methods",
##D   ylab="L1", xlim=c(300,50), ylim=c(0,.7))
##D 
##D ## You can specify whether the x-axis shows treated units, 
##D ## control units, or all units using the argument N, which 
##D ## can take the values "treated", "control", or "all".
##D ## Default is "treated".
##D 
##D plot(sp, N="all")
##D 
##D ## You can specify how the x-axis is scaled.  Setting scale.var=T
##D ## gives you the scaling as 1/sqrt(n).  Setting scale.var=F gives
##D ## scales it linearly.  Default is scale.var=T.
##D 
##D plot(sp, scale.var=F)
##D 
##D ## You can also specify which measure of balance to use
##D ## by specifying the argument "balance.metric" as
##D ## "L1", "mdiff" (Avg. standardized difference in means), 
##D ## or "mdisc" (Average Malanobis Discrepancy).  Default is "L1".
##D 
##D plot(sp, balance.metric="mdiff")
##D plot(sp, balance.metric="mdisc")
##D 
##D 
##D ## Matching solutions from other methods can be included in
##D ## a spacegraph by using the argument "other.matches".
##D ## First, Run a matching method.  Here, propensity scores from MatchIt.
##D library(MatchIt)
##D m.out <- matchit(formula=treated ~ education+age, data=LL, method = "nearest")
##D 
##D ## Put the required information into a list of data frames.
##D ## Note, there are many ways to do this.
##D mymatches <- list(data.frame(names(m.out$w)))
##D names(mymatches[[1]])[1] <- "id"
##D mymatches[[1]]$weight <- m.out$w
##D mymatches[[1]]$method <- "matchit psm"
##D 
##D sp <- spacegraph("treated", LL, drop="re78", M=5,
##D  R=list(cem=5,psm=5, mdm=5), other.matches=mymatches)
##D plot(sp)
##D 
## End(Not run)



