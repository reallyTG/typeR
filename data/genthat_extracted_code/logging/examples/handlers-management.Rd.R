library(logging)


### Name: handlers-management
### Title: Add a handler to or remove one from a logger.
### Aliases: handlers-management addHandler removeHandler

### ** Examples

logReset()
addHandler(writeToConsole)
names(getLogger()[["handlers"]])
loginfo("test")
removeHandler("writeToConsole")
logwarn("test")




