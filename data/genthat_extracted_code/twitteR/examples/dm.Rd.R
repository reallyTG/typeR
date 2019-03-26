library(twitteR)


### Name: dmGet
### Title: Functions to manipulate Twitter direct messages
### Aliases: dmGet dmSent dmDestroy dmSend
### Keywords: interface

### ** Examples

  ## Not run: 
##D            dms <- dmGet()
##D            dms
##D            ## delete the first one
##D            dms[[1]]$destroy()
##D            dmDestroy(dms[[2]])
##D            ## send a DM
##D            dmSend('Testing out twitteR!', 'twitter')
##D    
## End(Not run)



