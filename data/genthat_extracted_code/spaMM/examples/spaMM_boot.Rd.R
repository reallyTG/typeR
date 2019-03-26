library(spaMM)


### Name: spaMM_boot
### Title: Parametric bootstrap
### Aliases: spaMM_boot
### Keywords: htest

### ** Examples

if (spaMM.getOption("example_maxtime")>10) {
 data("blackcap")
 
 # Generate fits of null and full models:
 lrt <- fixedLRT(null.formula=migStatus ~ 1 + Matern(1|latitude+longitude),
       formula=migStatus ~ means + Matern(1|latitude+longitude), 
       HLmethod='ML',data=blackcap)

 # The 'simuland' argument: 
 myfun <- function(y, what=NULL, lrt, ...) { 
    data <- lrt$fullfit$data
    data$migStatus <- y ## replaces original response (! more complicated for binomial fits)
    full_call <- getCall(lrt$fullfit) ## call for full fit
    full_call$data <- data
    res <- eval(full_call) ## fits the full model on the simulated response
    if (!is.null(what)) res <- eval(what) ## post-process the fit
    return(res) ## the fit, or anything produced by evaluating 'what'
  }
  # where the 'what' argument (not required) of myfun() allows one to control 
  # what the function returns without redefining the function.
  
  # Call myfun() with no 'what' argument: returns a list of fits 
  spaMM_boot(lrt$nullfit, simuland = myfun, nsim=1, lrt=lrt)[["bootreps"]] 
  
  # Return only a model coefficient for each fit: 
  spaMM_boot(lrt$nullfit, simuland = myfun, nsim=7,
               what=quote(fixef(res)[2L]), lrt=lrt)[["bootreps"]]       
}



