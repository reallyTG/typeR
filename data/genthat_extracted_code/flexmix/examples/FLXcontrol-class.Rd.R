library(flexmix)


### Name: FLXcontrol-class
### Title: Class "FLXcontrol"
### Aliases: FLXcontrol-class coerce,list,FLXcontrol-method
###   coerce,NULL,FLXcontrol-method
### Keywords: classes

### ** Examples

## have a look at the defaults
new("FLXcontrol")

## corce a list
mycont <- list(iter = 200, tol = 0.001, class = "r")
as(mycont, "FLXcontrol")



