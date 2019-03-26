library(intsvy)


### Name: plot.intsvy.table
### Title: Graphical representation of frequency tables
### Aliases: plot.intsvy.table

### ** Examples

## Not run: 
##D # install pbiecek/PIAAC package from github to have access to piaac data
##D # age distribution in whole dataset
##D (ptable <- piaac.table(variable="AGEG10LFS", data=piaac))
##D 
##D # age distribution in whole dataset
##D plot(ptable)
##D plot(ptable, centered=TRUE)
##D 
##D # age distribution within countries
##D head(ptableC <- piaac.table(variable="AGEG10LFS", by="CNTRYID", data=piaac))
##D 
##D # age distribution within countries
##D plot(ptableC, stacked=TRUE)
##D plot(na.omit(ptableC), centered=TRUE)
##D 
##D # age distribution within countries and gender segments
##D head(ptableCA <- piaac.table(variable="AGEG10LFS", by=c("CNTRYID", "GENDER_R"), data=piaac))
##D 
##D # age distribution within countries and gender segments
##D plot(na.omit(ptableCA), stacked=TRUE)
##D plot(na.omit(ptableCA), centered=TRUE)
##D 
## End(Not run)



