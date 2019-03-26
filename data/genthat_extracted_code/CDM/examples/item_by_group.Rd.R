library(CDM)


### Name: item_by_group
### Title: Create Dataset with Group-Specific Items
### Aliases: item_by_group

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Create dataset with group-specific item responses
##D #############################################################################
##D 
##D data(data.mg, package="CDM")
##D dat <- data.mg
##D 
##D #-- create dataset with group-specific item responses
##D dat0 <- CDM::item_by_group( dat=dat[,paste0("I",1:5)], group=dat$group )
##D 
##D #-- summary statistics
##D summary(dat0)
##D colnames(dat0)
##D 
##D #-- set some items to invariant
##D invariant_items <- c("I1","I4")
##D dat1 <- CDM::item_by_group( dat=dat[,paste0("I",1:5)], group=dat$group,
##D             invariant=invariant_items)
##D colnames(dat1)
## End(Not run)



