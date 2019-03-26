library(remoter)


### Name: rhelp
### Title: rhelp
### Aliases: rhelp rhelp help ?

### ** Examples

## Not run: 
##D ### Prompts are listed to clarify when something is eval'd locally vs
##D ### remotely
##D > # suppressMessages(library(remoter, quietly = TRUE))
##D > # client()
##D > remoter::client("192.168.56.101")
##D 
##D remoter> rhelp("plot")
##D remoter> rhelp(package = "remoter")
##D remoter> rhelp("plot", package = "remoter")
##D 
##D remoter> rhelp("dev.off")
##D remoter> rhelp("dev.off", package = "remoter")
##D remoter> rhelp("dev.off", package = "grDevices")
##D 
##D remoter> help("par")
##D 
##D remoter> ?`+`
##D remoter> ?`?`
##D remoter> ?"??"
##D remoter> package?base
##D remoter> `?`(package, remoter)
##D 
##D 
##D remoter> q()
##D >
## End(Not run)




