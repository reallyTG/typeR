library(apsrtable)


### Name: modelInfo
### Title: Model fit and diagnostic functions for output
### Aliases: modelInfo modelInfo,summary.lm-method
###   modelInfo,summary.glm-method modelInfo,summary.svyglm-method
###   modelInfo,summary.tobit-method modelInfo,summary.gee-method
###   modelInfo,summary.coxph-method modelInfo,summary.clogit-method
###   modelInfo,summary.negbin-method modelInfo,summary.lrm-method

### ** Examples
 

setMethod("modelInfo", "summary.lm", function(x) {
  env <- sys.parent()
  digits <- evalq(digits, env)
  model.info <- list(
                     "$N$"=formatC(sum(x$df[1:2]),format="d"),
                     "Resid. sd" = formatC(x$sigma,format="f",digits=digits))
  class(model.info) <- "model.info"
  return(model.info)
} )

example(apsrtable)


### Switch back to the default
setMethod("modelInfo", "summary.lm", apsrtable:::modelInfo.summary.lm)
## Not run: 
##D example(apsrtable)
## End(Not run)



