library(intsvy)


### Name: plot.intsvy.mean
### Title: Graphical representation of means in groups
### Aliases: plot.intsvy.mean

### ** Examples

## Not run: 
##D # Country averages
##D head(pmeansNC <- piaac.mean.pv(pvlabel="NUM", by="CNTRYID", data=piaac, export=FALSE))
##D 
##D # plotting country average NUM performance 
##D plot(pmeansNC) + ggtitle("Country performance in NUM")
##D # without se bars, not good idea
##D plot(pmeansNC, se=FALSE)
##D # sorted, thats better
##D plot(pmeansNC, sort=TRUE)
##D 
##D # Country averages for different age groups
##D head(pmeansNCA <- piaac.mean.pv(pvlabel="NUM", by=c("CNTRYID", "AGEG10LFS"), 
##D                         data=piaac, export=FALSE))
##D #
##D # plotting country average within 
##D # age groups NUM performance 
##D plot(pmeansNCA, sort=TRUE)
##D 
##D # Country averages for different age and gender groups (changed order)
##D head(pmeansNCGA <- piaac.mean.pv(pvlabel="NUM", by=c("CNTRYID", "GENDER_R", "AGEG10LFS"), 
##D                          data=piaac, export=FALSE))
##D #
##D # plotting country average within 
##D # age and gender groups NUM performance 
##D plot(na.omit(pmeansNCGA), sort=TRUE)
##D 
## End(Not run)



