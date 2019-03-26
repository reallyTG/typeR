library(My.stepwise)


### Name: My.stepwise.lm
### Title: Stepwise Variable Selection Procedure for Linear Regression
###   Model
### Aliases: My.stepwise.lm

### ** Examples

data("LifeCycleSavings")
names(LifeCycleSavings)
dim(LifeCycleSavings)
my.variable.list <- c("pop15", "pop75", "dpi")
My.stepwise.lm(Y = "sr", variable.list = my.variable.list, in.variable = c("ddpi"),
   data = LifeCycleSavings)

my.variable.list <- c("pop15", "pop75", "dpi", "ddpi")
My.stepwise.lm(Y = "sr", variable.list = my.variable.list,
   data = LifeCycleSavings, sle = 0.25, sls = 0.25)



