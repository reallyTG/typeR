library(domino)


### Name: domino-package
### Title: Domino Data Lab R console bindings
### Aliases: domino-package
### Keywords: domino, dominoup package,

### ** Examples

## Not run: 
##D ## logins as a given user to the Domino server
##D ## and approves sending error reports to Domino.
##D domino.login("jglodek", "MySecretPassword", TRUE)
##D 
##D ## creates new project.
##D domino.create("my-new-project")
##D 
##D ## gets existing project from the server.
##D domino.get("jglodek/my-old-project")
##D 
##D ## gets existing project from the server.
##D domino.get("my-old-project")
##D 
##D ## initializes new domino project in current working directory with a given name.
##D domino.init("other-name")
##D 
##D ## downloads run results from Domino server.
##D domino.download()
##D 
##D ## uploads project files to Domino server.
##D domino.upload()
##D 
##D ## runs main.r in the cloud with given arguments.
##D domino.run("main.r", "other", "console", "arguments")
##D 
##D ## shows difference between current version and last uploaded version.
##D domino.diff()
##D 
##D ## displays current run's status in the console.
##D domino.status()
##D 
##D ## shows debug information
##D domino.debug()
##D 
##D ## resets project defined in by current working directory
##D domino.reset()
##D 
##D ## runs any of domino client command with given arguments
##D domino.runCommand("run my-file.r", successCallback, "failure message!")
##D 
## End(Not run)



