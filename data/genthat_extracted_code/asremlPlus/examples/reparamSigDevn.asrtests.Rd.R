library(asremlPlus)


### Name: reparamSigDevn.asrtests
### Title: Reparamterizes each random (deviations) term involving
###   'devn.fac' to a fixed term and ensures that the same term, with
###   'trend.num' replacing 'devn.fac', is included if any other term with
###   'trend.num' is included in 'terms'.
### Aliases: reparamSigDevn.asrtests reparamSigDevn
### Keywords: asreml

### ** Examples
## Not run: 
##D   data(WaterRunoff.dat)
##D   asreml.options(keep.order = TRUE) #required for asreml-R4 only
##D   current.asr <- asreml(fixed = log.Turbidity ~ Benches + Sources + Type + Species + 
##D                             Sources:Type + Sources:Species + Sources:Species:xDay + 
##D                             Sources:Species:Date, 
##D                         data = WaterRunoff.dat, keep.order = TRUE)
##D   current.asrt <- asrtests(current.asr, NULL, NULL)
##D 
##D   #Examine terms that describe just the interactions of Date and the treatment factors
##D   terms.treat <- c("Sources", "Type", "Species", "Sources:Type", "Sources:Species")
##D   date.terms <- sapply(terms.treat, 
##D                        FUN=function(term){paste("Date:",term,sep="")}, 
##D                        simplify=TRUE)
##D   date.terms <- c("Date", date.terms)
##D   date.terms <- unname(date.terms)
##D   treat.marginality <-  matrix(c(1,0,0,0,0,0, 1,1,0,0,0,0,  1,0,1,0,0,0, 
##D                                  1,0,1,1,0,0, 1,1,1,0,1,0, 1,1,1,1,1,1), nrow=6)
##D   rownames(treat.marginality) <- date.terms
##D   colnames(treat.marginality) <- date.terms
##D   choose <- chooseModel(current.asrt, treat.marginality, denDF="algebraic")
##D   current.asrt <- choose$asrtests.obj
##D   current.asr <- current.asrt$asreml.obj
##D   sig.date.terms <- choose$sig.terms
##D 
##D   #Remove all Date terms left in the fixed model
##D   terms <- "(Date/(Sources * (Type + Species)))"
##D   current.asrt <- changeTerms(current.asrt, dropFixed = terms)
##D   #if there are significant date terms, reparameterize to xDays + spl(xDays) + Date
##D   if (length(sig.date.terms) != 0)
##D   { #add lin + spl + devn for each to fixed and random models
##D     trend.date.terms <- sapply(sig.date.terms, 
##D                                FUN=function(term){sub("Date","xDay",term)}, 
##D                                simplify=TRUE)
##D     trend.date.terms <- paste(trend.date.terms,  collapse=" + ")
##D     current.asrt <- changeTerms(current.asrt, addFixed=trend.date.terms)
##D     trend.date.terms <- sapply(sig.date.terms, 
##D                                FUN=function(term){sub("Date","spl(xDay)",term)}, 
##D                                simplify=TRUE)
##D     trend.date.terms <- c(trend.date.terms, sig.date.terms)
##D     trend.date.terms <- paste(trend.date.terms,  collapse=" + ")
##D     current.asrt <- changeTerms(current.asrt, addRandom = trend.date.terms)
##D     current.asrt <- rmboundary(current.asrt)
##D   }
##D   
##D   #Now test terms for sig date terms
##D   spl.terms <- sapply(terms.treat, 
##D                       FUN=function(term){paste("spl(xDay):",term,sep="")}, 
##D                       simplify=TRUE)
##D   spl.terms <- c("spl(xDay)",spl.terms)
##D   lin.terms <- sapply(terms.treat, 
##D                       FUN=function(term){paste(term,":xDay",sep="")}, 
##D                       simplify=TRUE)
##D   lin.terms <- c("xDay",lin.terms)
##D   systematic.terms <- c(terms.treat, lin.terms, spl.terms, date.terms)
##D   systematic.terms <- unname(systematic.terms)
##D   treat.marginality <-  matrix(c(1,0,0,0,0,0, 1,1,0,0,0,0,  1,0,1,0,0,0, 
##D                                  1,0,1,1,0,0, 1,1,1,1,1,0, 1,1,1,1,1,1), nrow=6)
##D   systematic.marginality <- kronecker(matrix(c(1,0,0,0, 1,1,0,0, 
##D                                                1,1,1,0, 1,1,1,1), nrow=4), 
##D                                       treat.marginality)
##D   systematic.marginality <- systematic.marginality[-1, -1]
##D   rownames(systematic.marginality) <- systematic.terms
##D   colnames(systematic.marginality) <- systematic.terms
##D   choose <- chooseModel(current.asrt, systematic.marginality, 
##D                          denDF="algebraic", pos=TRUE)
##D   current.asrt <- choose$asrtests.obj
##D 
##D   #Check if any deviations are significant and, for those that are, go back to 
##D   #fixed dates
##D   current.asrt <- reparamSigDevn(current.asrt, choose$sig.terms, 
##D                                  trend.num = "xDay", devn.fac = "Date", 
##D                                  denDF = "algebraic")
## End(Not run)


