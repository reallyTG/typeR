library(asremlPlus)


### Name: chooseModel.asrtests
### Title: Determines the set of significant terms taking into account the
###   hierarchy or marginality relations and records the tests performed in
###   a data.frame.
### Aliases: chooseModel.asrtests chooseModel
### Keywords: asreml htest

### ** Examples
## Not run: 
##D data(WaterRunoff.dat)
##D asreml.options(keep.order = TRUE) #required for asreml-R4 only
##D current.asr <- asreml(log.Turbidity ~ Benches + (Sources * (Type + Species)) * Date, 
##D                       random = ~Benches:MainPlots:SubPlots:spl(xDay), 
##D                       data = WaterRunoff.dat, keep.order = TRUE)
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D terms.treat <- c("Sources", "Type", "Species", 
##D                  "Sources:Type", "Sources:Species")
##D terms <- sapply(terms.treat, 
##D                 FUN=function(term){paste("Date:",term,sep="")}, 
##D                 simplify=TRUE)
##D terms <- c("Date", terms)
##D terms <- unname(terms)
##D marginality <-  matrix(c(1,0,0,0,0,0, 1,1,0,0,0,0,  1,0,1,0,0,0, 
##D                          1,0,1,1,0,0, 1,1,1,0,1,0, 1,1,1,1,1,1), nrow=6)
##D rownames(marginality) <- terms
##D colnames(marginality) <- terms
##D choose <- chooseModel(current.asrt, marginality) 
##D current.asrt <- choose$asrtests.obj
##D sig.terms <- choose$sig.terms
## End(Not run)


