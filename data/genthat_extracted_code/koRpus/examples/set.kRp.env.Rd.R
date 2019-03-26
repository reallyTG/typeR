library(koRpus)


### Name: set.kRp.env
### Title: A function to set information on your koRpus environment
### Aliases: set.kRp.env
### Keywords: misc

### ** Examples

## Not run: 
##D set.kRp.env(TT.cmd="~/bin/treetagger/cmd/tree-tagger-german", lang="de")
##D get.kRp.env(TT.cmd=TRUE)
##D 
##D # example for setting permanent default values in an .Rprofile file
##D options(
##D   koRpus=list(
##D     TT.cmd="manual",
##D     TT.options=list(
##D       path="~/bin/treetagger",
##D       preset="de"),
##D     lang="de",
##D     noStartupMessage=TRUE
##D   )
##D )
##D # be aware that setting a permamnent default language without loading
##D # the respective language support package might trigger errors
## End(Not run)



