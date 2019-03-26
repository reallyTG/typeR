library(sensors4plumes)


### Name: replaceDefault
### Title: Replace default values in functions and check parameter list
### Aliases: replaceDefault

### ** Examples

# examples with warnings
fun1 = "a"
fun_1 = replaceDefault(fun1)
fun2 = function(x){sum(x)}
fun_2 = replaceDefault(fun2, type = "fun.simulationsApply")
fun3 = function(simulations, locations){1}
# change default of 'simulations' 
fun_3 = replaceDefault(fun3, type = "costFun", 
  newDefaults = list(nout = 1, simulations = 10))  
# example without warnings 
# (new default values have different class, not tested)
fun6 = function(x = 17, weight = "a", extraWeight = matrix(1:12, nrow = 3)){}
fun_6 = replaceDefault(fun6, 
  newDefaults = list(weight = 3, extraWeight = "c"), 
  type =  "summaryFun.summaryPlumes") 



