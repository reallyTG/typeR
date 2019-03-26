library(PBSmodelling)


### Name: presentTalk
### Title: Run a Presentation in R
### Aliases: presentTalk

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   cwd = getwd()
##D   talk_dir <- system.file("examples", package = "PBSmodelling" )
##D   setwd(talk_dir)
##D   presentTalk( "swisstalk.xml" ) # closing the GUI should restore cwd
##D })
## End(Not run)



