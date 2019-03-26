library(spatstat)


### Name: progressreport
### Title: Print Progress Reports
### Aliases: progressreport
### Keywords: print

### ** Examples

  for(i in 1:40) {
     #
     # code that does something...
     # 
     progressreport(i, 40)
  }

  # saving internal state: *recommended*
  sta <- list()
  for(i in 1:20) {
     # some code ...
     sta <- progressreport(i, 20, state=sta)
  }

  #' use text progress bar
  sta <- list()
  for(i in 1:10) {
     # some code ...
     sta <- progressreport(i, 10, state=sta, style="txtbar")
  }




