library(JGR)


### Name: jgr.addMenuItem
### Title: New JGR Console MenuItem
### Aliases: jgr.addMenuItem jgr.insertMenuItem
### Keywords: programming

### ** Examples

jgr.addMenu("Workspace")
jgr.addMenuItem("Workspace","Browse","ls()",FALSE)
jgr.addMenuSeparator("Workspace")
jgr.addMenuItem("Workspace","List Functions",
  function() unlist(lapply(ls(envir=.GlobalEnv),
                           function(x) if (is.function(get(x))) x else NULL )))



