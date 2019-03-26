library(tcltk2)


### Name: tclTask
### Title: Schedule and manage delayed tasks
### Aliases: tclTaskSchedule tclTaskRun tclTaskGet tclTaskChange
###   tclTaskDelete tclAfter tclAfterCancel tclAfterInfo
### Keywords: utilities

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D ## Run just once, after 1 sec
##D test <- function () cat("==== Hello from Tcl! ====\n")
##D tclTaskSchedule(1000, test())
##D Sys.sleep(2)
##D 
##D ## Run ten times a task with a specified id
##D test2 <- function () cat("==== Hello again from Tcl! ====\n")
##D tclTaskSchedule(1000, test2(), id = "test2", redo = 10)
##D Sys.sleep(1)
##D 
##D ## Run a function with arguments (will be evaluated in global environment)
##D test3 <- function (txt) cat(txt, "\n")
##D msg <- "==== First message ===="
##D tclTaskSchedule(1000, test3(msg), id = "test3", redo = TRUE)
##D Sys.sleep(2)
##D msg <- "==== Second message ===="
##D Sys.sleep(2)
##D 
##D ## Get info on pending tasks
##D tclTaskGet() # List all (non hidden) tasks
##D tclTaskGet("test2")
##D ## List all active Tcl timers
##D tclAfterInfo()
##D 
##D ## Change a task (run 'test3' only once more, after 60 sec)
##D tclTaskChange("test3", wait = 60000, redo = 1)
##D Sys.sleep(1)
##D ## ... but don't wait so long and force running 'test3' right now
##D tclTaskRun("test3")
##D 
##D Sys.sleep(3)
##D ## finally, delete all pending tasks
##D tclTaskDelete(NULL)
## End(Not run)



