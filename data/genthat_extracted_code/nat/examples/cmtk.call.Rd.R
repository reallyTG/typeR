library(nat)


### Name: cmtk.call
### Title: Utility function to create and run calls to CMTK commandline
###   tools
### Aliases: cmtk.call cmtk.system2

### ** Examples

## Not run: 
##D cmtk.call("reformatx",'--outfile=out.nrrd', floating='floating.nrrd',
##D   mask=TRUE, target.offset=c(1,2,3), FINAL.ARGS=c('target.nrrd','reg.list'))
##D # get help for a cmtk tool
##D system(cmtk.call('reformatx', help=TRUE))
## End(Not run)
## Not run: 
##D cmtk.system2(cmtk.call('mat2dof', help=TRUE, RETURN.TYPE="list"))
##D # capture response into an R variable
##D helptext=cmtk.system2(cmtk.call('mat2dof', help=TRUE, RETURN.TYPE="list"),
##D   stdout=TRUE)
## End(Not run)



