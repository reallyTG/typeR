library(ODB)


### Name: progress-class
### Title: Classes "progress", "progress.file" and "progress.console"
### Aliases: progress progress-class progress.console-class
###   initialize,progress.console-method set,progress.console-method
###   progress.file-class initialize,progress.file-method
###   set,progress.file-method set

### ** Examples

  # File oriented progression
  testFun = function() {
    obj <- new("progress.file", main="Iterating", iMax=50)
    for(i in 1:50) {
      obj = set(obj, i)
      Sys.sleep(0.1)
    }
  }
  testFun()
 
  # Console oriented progression
  testFun = function() {
    obj <- new("progress.console", main="Iterating", iMax=50)
    for(i in 1:50) {
      obj = set(obj, i)
      Sys.sleep(0.1)
    }
  }
  testFun()



