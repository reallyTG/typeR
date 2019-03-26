library(afex)


### Name: afex_options
### Title: Set/get global afex options
### Aliases: afex_options

### ** Examples

afex_options() # see all options

afex_options("return_aov") #get single option

aop <- afex_options() # save current options

## Not run: 
##D # change options
##D afex_options(return_aov = "nice")
##D afex_options("return_aov") #get single option
##D afex_options(return_aov = "nice", method_mixed = "LRT")
##D afex_options("method_mixed") #get single option
##D # do something
## End(Not run)
afex_options(aop) # reset options




