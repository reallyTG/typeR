library(rbugs)


### Name: genBugsScript
### Title: Generating Script File for BUGS
### Aliases: genBugsScript
### Keywords: utilities interface

### ** Examples

## no tested examples for mac-os.
## Not run: 
##D script.file <- paste(tempfile("script"), ".txt", sep="")
##D genBugsScript(paramSet=c("alpha", "theta"), n.chains=2, n.keep=1500,
##D               n.burnin=500, n.thin=1,
##D               model.file="~/tmp/model.txt",
##D               data.file="~/tmp/data.txt",
##D               inits.file=c("~/tmp/init1.txt",
##D                            "~/tmp/init2.txt"),
##D               bugsWorkingDir=" ~/tmp/",
##D               script=script.file)
##D file.show(script.file)
##D unlink(script.file)

## End(Not run)



