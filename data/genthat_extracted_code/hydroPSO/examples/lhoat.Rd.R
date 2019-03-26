library(hydroPSO)


### Name: lhoat
### Title: Latin-Hypercube One-factor-At-a-Time
### Aliases: lhoat
### Keywords: manip math

### ** Examples



##################################################
# Example 1: Linear model (n=3)                  #
##################################################
# Distributions for the three parameters, are all uniform in the intervals
# [0.5, 1.5], [1.5, 4.5], and [4.5,13.5], respectively.

# 1.1) defining the dimension of the parameter space
nparam <- 3

# 1.2) defining the model
linear <- function(x) x[1] + x[2] + x[3]

# Parameter ranges
lower <- c(0.5, 1.5, 4.5)
upper <- c(1.5, 4.5, 13.5)

# Given names to the parameters
names(lower) <- c("a","b","c")

# 1.3) Running the LH-OAT sensitivity analysis for the 'linear' test function
#      The model is linear and since x[3] has the largest mean value, it should
#      be the most important factor. 
set.seed(123) 
lhoat(
      fn=linear, 
      lower=lower, 
      upper=upper,
      control=list(N=50, f=0.015, write2disk=FALSE, verbose=FALSE)      
      )

## Not run: 
##D ##################################################
##D # Example 2: non-linear monotonic model (n=2)    #
##D ##################################################
##D # A uniform distribution in the interval [0, 5] was assigned to the two 
##D # parameters of the 'non.linear' function (see below). This makes the second 
##D # factor (x[2]) more important than the first one (x[1]).
##D 
##D # 2.1) defining the dimension of the parameter space
##D nparam <- 2
##D 
##D # 2.2) defining the model
##D non.linear <- function(x) x[1] + x[2]^4
##D 
##D # 2.3) Running the LH-OAT sensitivity analysis for the 'non.linear' test function
##D #      The model is linear and since x[2] has the largest mean value, it should
##D #      be the most important factor. 
##D setwd("~")
##D set.seed(123) 
##D lhoat(
##D       fn=non.linear, 
##D       lower=rep(0, nparam), 
##D       upper=rep(5, nparam),
##D       control=list(N=100, f=0.005, write2disk=TRUE, verbose=FALSE)      
##D       )
##D 
##D # 2.4) reading ALL the parameter sets used in LH-OAT, and plotting dotty plots     
##D params <- read_params(file="LH_OAT/LH_OAT-gof.txt", header=TRUE, skip=0, 
##D                       param.cols=2:(nparam+1), of.col=1, of.name="non.linear", 
##D                       ptype="dottyplot")
##D 
##D 
##D ##################################################
##D # Example 3: non-monotonic model (ishigmai, n=3) #
##D ##################################################
##D #  All three input factors have uniform distributions in the range [-pi, pi]. 
##D 
##D # 3.1) defining the dimension of the parameter space
##D nparam <- 3
##D 
##D # 3.2) defining the model
##D ishigami <- function(x, a=7, b=0.1) {
##D   sin(x[1]) + a*(sin(x[2]))^2 + b*(x[3]^4)*sin(x[1]) 
##D }
##D 
##D # 3.3) Running the LH-OAT sensitivity analysis for the 'Ishigami' test function.
##D #      First order analytical sensitivity indices for the Ishigami function are:
##D #      S1=0.3138, S2=0.4424, S3=0.0000. Therefore, the first order sensitivity 
##D #      indices indicate that factor x[2] is more important than factor x[1], and
##D #      x[3] does not contribute to the unconditional variance of the Ishigami
##D #      output.
##D # NOTE: in the following example, parameters are correctly ranked, but the 
##D #      normalised Relative Importance given as output ('RelativeImportance.Norm')
##D #      can not be directly compared to first order sensitivity indices.
##D 
##D setwd("~")
##D set.seed(123) 
##D lhoat(
##D       fn=ishigami, 
##D       lower=rep(-pi, nparam), 
##D       upper=rep(pi, nparam),
##D       control=list(N=5000, f=0.1, write2disk=TRUE, verbose=FALSE, normalise=TRUE)         
##D       )
##D 
##D # 3.4) Reading ALL the parameter sets used in LH-OAT, and plotting dotty plots     
##D params <- read_params(file="LH_OAT/LH_OAT-gof.txt", header=TRUE, skip=0, 
##D                       param.cols=2:(nparam+1), of.col=1, of.name="non.linear", 
##D                       ptype="dottyplot")     
##D 
## End(Not run)



