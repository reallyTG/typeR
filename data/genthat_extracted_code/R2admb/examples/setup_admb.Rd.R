library(R2admb)


### Name: setup_admb
### Title: Set up AD Model Builder environment variables
### Aliases: setup_admb clean_admb
### Keywords: environment misc

### ** Examples


 orig <- Sys.getenv("ADMB_HOME")
## this doesn't make sense but won't break anything
## until you actually try to run AD Model Builder
 setup_admb("elsewhere")   
 Sys.setenv(ADMB_HOME="") ## erase environment variable
## Not run: 
##D  setup_admb()              ## auto-locate (fails if ADMB not found)
## End(Not run)
 Sys.setenv(ADMB_HOME=orig) ## restore sanity




