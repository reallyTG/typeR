library(DescTools)


### Name: DescToolsOptions
### Title: DescTools Options
### Aliases: DescToolsOptions

### ** Examples

DescToolsOptions("plotit")

## Not run: 
##D 
##D # Get all options, defaults are attributed as such
##D DescToolsOptions()
##D 
##D # get some options
##D DescToolsOptions("plotit", "lang")
##D 
##D # get some potentially undefined option, while taking a user default and
##D # overriding system defaults
##D DescToolsOptions("stamp", default="Condor, 2016")
##D 
##D # get an undefined option, should return default
##D DescToolsOptions("stampede", default="Condor, 2016")
##D 
##D # set options, while getting the old values
##D opt <- DescToolsOptions(plotit=789, lang="portugues")
##D DescToolsOptions()
##D # output the old values
##D opt
##D 
##D # just a single argument
##D DescToolsOptions(digits=2)
##D 
##D # reset the old values
##D DescToolsOptions(opt)
##D DescToolsOptions()
##D 
##D # reset factory defaults
##D DescToolsOptions(reset=TRUE)
## End(Not run)


