library(HH)


### Name: AEdotplot.data.frame
### Title: AE (Adverse Events) dotplot of incidence and relative risk,
###   support functions
### Aliases: AEdotplot.data.frame AEdotplot.AElogrelrisk AEdotplot.AEtable
###   print.AEdotplot c.AEdotplot AElogrelrisk AEmatchSortorder
###   update.AEdotplot
### Keywords: hplot htest

### ** Examples

## Not run: 
##D ## variable names in the input data.frame aeanonym
##D ## RAND   treatment as randomized
##D ## PREF   adverse event symptom name
##D ## SN     number of patients in treatment group
##D ## SAE    number of patients  in each group for whom the event PREF was observed
##D ## OrgSys Organ System
##D ##
##D ## Input sort order is PREF/RAND
##D 
##D data(aeanonym)
##D head(aeanonym)
##D 
##D ## variable names are hard-wired in the program
##D ## names(aeanonym) <- c("RAND", "PREF", "SAE", "SN", "OrgSys")
##D 
##D 
##D ## Calculate log relative risk and confidence intervals (95##D 
##D ## AElogrelrisk sets the sort order for PREF to match the relative risk.
##D aeanonymr <- AElogrelrisk(aeanonym) ## PREF sorted by relative risk
##D head(aeanonymr)
##D class(aeanonymr$PREF)
##D levels(aeanonymr$PREF)
##D 
##D AEdotplot(aeanonym)
##D \dontrun{
##D AEdotplot(aeanonym, sort=FALSE)
##D }
##D AEdotplot(aeanonym, conditionVariable=aeanonym$OrgSys)
##D 
##D aefake <- rbind(cbind(aeanonym, group="ABC"), cbind(aeanonym, group="DEF"))
##D aefake$SAE[67:132] <- sample(aefake$SAE[67:132])
##D aefake$OrgSys.group <- with(aefake, interaction(OrgSys, group))
##D 
##D ## fake 2
##D KEEP <- aefake$OrgSys %in% c("GI","Resp")
##D 
##D AEfakeGR <- AEdotplot(aefake[KEEP,], conditionVariable=aefake$OrgSys.group[KEEP],
##D             sub=list("ABC and DEF have different sort orders for PREF", cex=.7))
##D AEfakeGR ## ABC and DEF have different sort orders for PREF
##D 
##D AEfakeGR1 <- AEdotplot(aefake[KEEP & (1:132) <= 66,],
##D                        conditionVariable=aefake$OrgSys.group[KEEP & (1:132) <= 66])
##D AEfakeGR2 <- AEdotplot(aefake[KEEP & (1:132) >= 67,],
##D                        conditionVariable=aefake$OrgSys.group[KEEP & (1:132) >= 67])
##D 
##D AEfakeGR1
##D AEfakeGR2
##D 
##D AEfakeMatched <- AEmatchSortorder(AEfakeGR1, AEfakeGR2)
##D update(do.call(c, AEfakeMatched),
##D        main="ABC sorted by Relative Risk; DEF matches ABC order")
## End(Not run)
## Please see  ?AEdotplot  for examples using the formula method
##
## Many more examples are in demo("AEdotplotManyExamples")



