library(SmoothWin)


### Name: SmoothWin
### Title: Implementation of the soft windowing on the linear models
### Aliases: SmoothWin
### Keywords: "Windowing", "SmoothWin"

### ** Examples

# All examples use the Orthodont dataset in the nlme package
library(nlme)
# Sort the data on the time component (age)
Orthodont =  Orthodont[order(Orthodont$age),]
# Modes
mode = which(Orthodont$age %in%  c(12))
# Time component
time = Orthodont$age

#################### Examples ####################
### Example 1. Linear model
# Method 1 (recommanded)
f  = formula(distance ~ Sex)
lm = do.call('lm', list(formula = f, data = Orthodont))
rm(f)

# Method 2 (can cause error if you pass the formula to the lm function)
# lm = lm(distance ~ Sex, data = Orthodont)

lm.result = SmoothWin(
  object = lm,
  data = Orthodont,
  t = time,
  m = mode,
  check = 0,
  weightFUN = function(x) {
    x
  }
)
plot(
  lm.result,
  col = Orthodont$Sex,
  pch = as.integer(Orthodont$Sex),
  main = 'Simple liner model'
)


#### Example 2. Linear Model Using Generalized Least Squares
# Method 1 (recommanded)
f   = formula(distance ~ Sex)
gls = do.call('gls', list(model = f, data = Orthodont))
rm(f)

# Method 2 (can cause error if you pass the formula to the gls function)
# gls = gls(distance ~ Sex, data = Orthodont)

gls.result = SmoothWin(
  object = gls,
  data = Orthodont,
  t = time,
  m = mode,
  check = 0,
  weightFUN = function(ignore.me) {
    varFixed( ~ 1 / ModelWeight) #nlme package uses the inverse weights
  }
)
plot(
  gls.result,
  col = Orthodont$Sex,
  pch = as.integer(Orthodont$Sex),
  main = 'Linear model using GLS'
)

#### Example 3. Linear mixed model
# Method 1 (recommanded)
fixed  = formula(distance ~ Sex)
random = formula( ~ 1 | Subject)
lme = do.call('lme', list(
  fixed = fixed,
  random = random,
  data = Orthodont
))
rm(fixed, random)

# Method 2 (can cause error if you pass the formula to the lme function)
# lme = lme(fixed = distance ~ Sex, random=~1|Subject , data = Orthodont)

lme.result = SmoothWin(
  object = lme,
  data = Orthodont,
  t = time,
  m = mode,
  # Remove zero weights as well as single observation dates
  check = 1,
  weightFUN = function(ignore.me) {
    varFixed( ~ 1 / ModelWeight)
  }
)
plot(
  lme.result,
  col = Orthodont$Sex,
  pch = as.integer(Orthodont$Sex),
  main = 'Linear mixed model'
)





