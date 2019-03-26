library(mondate)


### Name: diff.mondate
### Title: 'diff' for package mondate
### Aliases: diff.mondate

### ** Examples

evalDate<-mondate(c(12+12*1:10))  # year ends 2001, ..., 2010
diff(evalDate)                    # vector of length 9 holding the number 12, 
                                  # with "timeunits" attribute = "months"



