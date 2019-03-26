library(MicroMacroMultilevel)


### Name: adjusted.predictors
### Title: Calculating the Adjusted Group Means of Individual-Level
###   Variables in a Micro-Macro Multilevel Situation
### Aliases: adjusted.predictors
### Keywords: group-level individual-level micro-macro, modeling,
###   multilevel outcome predict predictors to using variables

### ** Examples

######## SETUP: DATA GENERATING PROCESSES ########
set.seed(123)
# Step 1. Generate a G-by-q data frame of group-level predictors (e.g., control variables), z.data
# In this example, G = 40, q = 2
group.id = seq(1, 40)
z.var1 = rnorm(40, mean=0, sd=1)
z.var2 = rnorm(40, mean=100, sd=2)
z.data = data.frame(group.id, z.var1, z.var2)
# Step 2. Generate a G-by-p data frame of group-level means for the predictors that will be used to
# generate x.data
# In this example, there are 3 individual-level predictors, thus p = 3
x.var1.means = rnorm(40, mean=50, sd = .05)
x.var2.means = rnorm(40, mean=20, sd = .05)
x.var3.means = rnorm(40, mean=-10, sd = .05)
x.data.means = data.frame(group.id, x.var1.means, x.var2.means, x.var3.means)
# Step 3. Generate two N-by-p data frames of individual-level predictors, x.data
# One of these two data frames assumes unequal-sized groups (Step 3a),
# whereas the other assumes equal-sized groups (Step 3b):
# Step 3a. Generate the individual-level predictors
# In this example, N = 200 and group size is unequal
x.data.unequal = data.frame( group.id=rep(1:40, times=sample( c(4,5,6), 40, replace=TRUE) )[1:200] )
x.data.unequal = merge( x.data.unequal,
              data.frame( group.id, x.var1.means, x.var2.means, x.var3.means ), by="group.id" )
x.data.unequal = within( x.data.unequal, {
  x.var1 = x.var1.means + rnorm(200, mean=0, sd = 2)
  x.var2 = x.var2.means + rnorm(200, mean=0, sd = 6)
  x.var3 = x.var3.means + rnorm(200, mean=0, sd = 1.5)
})
# Step 3b. Generate the individual-level predictors
# In this example, N = 200 and group size is equal
x.data.equal = data.frame( group.id=rep(1:40, each=5) )
x.data.equal = merge( x.data.equal, x.data.means, by="group.id" )
x.data.equal = within( x.data.equal, {
  x.var1 = x.var1.means + rnorm(200, mean=0, sd = 2)
  x.var2 = x.var2.means + rnorm(200, mean=0, sd = 6)
  x.var3 = x.var3.means + rnorm(200, mean=0, sd = 1.5)
})
# Step 3. Generate a G-by-1 data frame of group-level outcome variable, y
# In this example, G = 40
y = rnorm(40, mean=6, sd=5)

apply(x.data.equal,2,mean)
#    group.id x.var1.means x.var2.means x.var3.means       x.var3       x.var2       x.var1
# 20.500000    50.000393    19.994708    -9.999167   -10.031995    20.185361    50.084635
apply(x.data.unequal,2,mean)
#    group.id x.var1.means x.var2.means x.var3.means       x.var3       x.var2       x.var1
# 20.460000    50.002286    19.994605    -9.997034    -9.983146    19.986111    50.123591
apply(z.data,2,mean)
# z.var1      z.var2
# 0.04518332 99.98656817
mean(y)
# 6.457797

######## EXAMPLE 1. GROUP SIZE IS DIFFERENT ACROSS GROUPS ########
######## Need to use adjusted.predictors() in the same package ###

# Step 4a. Generate a G-by-1 matrix of group ID, z.gid. Then generate an N-by-1 matrix of
# each individual's group ID, x.gid, where the group sizes are different
z.gid = seq(1:40)
x.gid = x.data.unequal$group.id
# Step 5a. Generate the best linear unbiased predictors that are calcualted from
# individual-level data
x.data = x.data.unequal[,c("x.var1","x.var2","x.var3")]
results = adjusted.predictors(x.data, z.data, x.gid, z.gid)
# Note: Given the fixed random seed, the output should be as below
results$unequal.groups
# TRUE
names(results$adjusted.group.means)
# "BLUP.x.var1" "BLUP.x.var2" "BLUP.x.var3" "z.var1"      "z.var2"      "gid"
head(results$adjusted.group.means)
#   BLUP.x.var1 BLUP.x.var2 BLUP.x.var3 group.id      z.var1    z.var2 gid
# 1    50.05308    20.83911  -10.700361        1 -0.56047565  98.61059   1
# 2    48.85559    22.97411   -9.957270        2 -0.23017749  99.58417   2
# 3    50.16357    19.50001   -9.645735        3  1.55870831  97.46921   3
# 4    49.61853    21.25962  -10.459398        4  0.07050839 104.33791   4
# 5    50.49673    21.38353   -9.789924        5  0.12928774 102.41592   5
# 6    50.86154    19.15901   -9.245675        6  1.71506499  97.75378   6

######## EXAMPLE 2. GROUP SIZE IS THE SAME ACROSS ALL GROUPS ########
######## Need to use adjusted.predictors() in the same package ###

# Step 4b. Generate a G-by-1 matrix of group ID, z.gid. Then generate an N-by-1 matrix of
# each individual's group ID, x.gid, where group size is the same across all groups
z.gid = seq(1:40)
x.gid = x.data.equal$group.id
# Step 5b. Generate the best linear unbiased predictors that are calcualted from
# individual-level data
x.data = x.data.equal[,c("x.var1","x.var2","x.var3")]
results = adjusted.predictors(x.data, z.data, x.gid, z.gid)
results$unequal.groups
# FALSE
names(results$adjusted.group.means)
# "BLUP.x.var1" "BLUP.x.var2" "BLUP.x.var3" "z.var1"      "z.var2"      "gid"
results$adjusted.group.means[1:5, ]
#   BLUP.x.var1 BLUP.x.var2 BLUP.x.var3 group.id      z.var1    z.var2 gid
# 1    50.91373    19.12994  -10.051647        1 -0.56047565  98.61059   1
# 2    50.19068    19.17978  -10.814382        2 -0.23017749  99.58417   2
# 3    50.13390    20.98893   -9.952348        3  1.55870831  97.46921   3
# 4    49.68169    19.60632  -10.612717        4  0.07050839 104.33791   4
# 5    50.28579    22.07469  -10.245505        5  0.12928774 102.41592   5



