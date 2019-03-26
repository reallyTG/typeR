library(mondate)


### Name: displayFormat-methods
### Title: Methods to Access 'displayFormat' Property
### Aliases: displayFormat-methods displayFormat,mondate-method
###   displayFormat,ANY-method displayFormat displayFormat<--methods
###   displayFormat<-,mondate-method displayFormat<-
### Keywords: methods

### ** Examples

x<-mondate("2010-6-30")            # The middle of 2010
displayFormat(x)                   # "%Y-%m-%d"
displayFormat(x) <- "%m/%d/%Y"
x                                  # x now displays as 06/30/2010



