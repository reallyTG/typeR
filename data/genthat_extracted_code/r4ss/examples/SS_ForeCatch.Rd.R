library(r4ss)


### Name: SS_ForeCatch
### Title: Create table of fixed forecast catches
### Aliases: SS_ForeCatch

### ** Examples


  ## Not run: 
##D     # create table for next two hears based on 
##D     SS_ForeCatch(base,               # object created by SS_output
##D                  yrs=2015:2016,      # years with fixed catch
##D                  average=TRUE,       # catch by fleet from average catch
##D                                      # (not harvest control rule)
##D                  avg.yrs=2010:2014,  # use average of catches over past 5 years
##D                  total=c(6.6,6.8))   # scale totals equal to ACLs (from John DeVore)
##D 
##D     # create table based on harvest control rule projection in SS
##D     # that can be mapped into an alternative state of nature
##D     SS_ForeCatch(low_state,          # object created by SS_output for low state 
##D                  yrs=2017:2026,      # forecast period after fixed ACL years
##D                  average=FALSE)      # use values forecast in SS, not historic catch
##D 
##D   
## End(Not run)




