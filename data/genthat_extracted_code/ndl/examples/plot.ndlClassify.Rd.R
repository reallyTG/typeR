library(ndl)


### Name: plot.ndlClassify
### Title: Plot function for selected results of 'ndlClassify'.
### Aliases: plot.ndlClassify plot.ndlWeights plot.ndlProbabilities
### Keywords: classif

### ** Examples

## Not run: 
##D 
##D data(think)
##D think.ndl <- ndlClassify(Lexeme ~ Agent + Patient + Section, data=think)
##D 
##D plot(think.ndl, values="weights")
##D plot(think.ndl, values="weights", type="hist", panes="multiple")
##D plot(think.ndl, values="weights", type="density", panes="multiple")
##D plot(think.ndl, values="weights", type="density", panes="multiple",
##D    predictors="Section*")
##D plot(think.ndl, values="weights", type="density", panes="multiple",
##D    predictors="Patient*")
##D plot(think.ndl, values="weights", type="hist", panes="multiple", col=1:4)
##D plot(think.ndl, values="weights", type="density", panes="single",
##D    outcomes=c("ajatella","miettia","pohtia","harkita"))
##D 
##D plot(think.ndl, values="probabilities")
##D plot(think.ndl, values="probabilities", panes="multiple")
##D plot(think.ndl, values="probabilities", select="max")
##D plot(think.ndl, values="probabilities", select=c(1:3))
##D plot(think.ndl, values="probabilities", panes="multiple", select=c(1:3))
##D plot(think.ndl, values="probabilities", type="sort", legend.position="topleft")
##D plot(think.ndl, values="probabilities", type="sort", pch=".",
##D    legend.position="topleft")
##D plot(think.ndl, values="probabilities", type="sort", pch=".", panes="multiple")
## End(Not run)



