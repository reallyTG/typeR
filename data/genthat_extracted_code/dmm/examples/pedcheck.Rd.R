library(dmm)


### Name: pedcheck
### Title: Checks that the Id, SId, and DId columns of a dataframe are
###   valid for function 'dmm()'.
### Aliases: pedcheck
### Keywords: manip

### ** Examples


library(dmm)
data(dt8bal.df)
pedcheck(dt8bal.df)
# this one returns 
#[1] 0
# which is a pass
## Not run: 
##D data(sheep.df)
##D pedcheck(sheep.df)
##D # this one returns 
##D #Id's must start at 1:
##D #Id's must be an arithmetic sequence:
##D #Id's must be unique:
##D #DId's must occur as an Id in the dataframe:
##D #All DId's must be female:
##D #[1] 5
##D # which is a fail
## End(Not run)
rm(dt8bal.df)



