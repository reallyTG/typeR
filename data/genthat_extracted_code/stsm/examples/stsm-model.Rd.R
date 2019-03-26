library(stsm)


### Name: stsm.model
### Title: Wrapper for Constructor of Objects of Class 'stsm'
### Aliases: stsm.model
### Keywords: ts, model

### ** Examples

# sample model with arbitrary parameter values
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 6), nopars = c("var3" = 12))
m

# parameter values
v <- c("var1" = 2, "var2" = 6, "var3" = 3, "var4" = 12)

# define the parameter 'cpar' and let the the remaining parameters 
# be defined by default in the slots 'pars' and 'nopars'
m <- stsm.model(model = "BSM", y = JohnsonJohnson, 
  pars = NULL, nopars = NULL, cpar = v[1])
m@pars
m@nopars
m@cpar

# define the slot 'pars', only 'v[1]' is stored in 'pars'
# the remaining variances are moved to 'nopars' along
# with the initial state vector and its variances
m <- stsm.model(model = "BSM", y = JohnsonJohnson, 
  pars = v[1])
m@pars
m@nopars
m@cpar

# define some of the parameters to be stored in the slot 'nopars' 
# 'only 'v[1:2]' is added to the remaining elements in 'nopars'; 
# by default the variances not defined in 'nopars' are assigned to 
# 'pars' with value 1
m <- stsm.model(model = "BSM", y = JohnsonJohnson, 
  nopars = v[1:2])
m@pars
m@nopars
m@cpar

# define the slot 'pars' and set a particular value to 
# some variances stored in 'nopars', 'v[2:3]'
# 'var4' takes the default value 1 and is stored in 'nopars' 
# since the definition 'pars = v[1]' excludes it form 'pars'
m <- stsm.model(model = "BSM", y = JohnsonJohnson, 
  pars = v[1], nopars = v[2:3])
m@pars
m@nopars
m@cpar

# define the slots 'pars' and 'cpar'
# the remaining parameters are stored in 'nopars' with the 
# values by default
m <- stsm.model(model = "BSM", y = JohnsonJohnson, 
  pars = v[2:4], nopars = NULL, cpar = v[1])
m@pars
m@nopars
m@cpar



