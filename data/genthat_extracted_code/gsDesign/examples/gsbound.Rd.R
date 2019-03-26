library(gsDesign)


### Name: gsBound
### Title: 2.7: Boundary derivation - low level
### Aliases: gsBound gsBound1
### Keywords: design

### ** Examples

# set boundaries so that probability is .01 of first crossing
# each upper boundary and .02 of crossing each lower boundary
# under the null hypothesis
x <- gsBound(I=c(1, 2, 3)/3, trueneg=array(.02, 3),
             falsepos=array(.01, 3))
x

#  use gsBound1 to set up boundary for a 1-sided test
x <- gsBound1(theta= 0, I=c(1, 2, 3) / 3, a=array(-20, 3),
              probhi=c(.001, .009, .015))
x$b

# check boundary crossing probabilities with gsProbability 
y <- gsProbability(k=3, theta=0, n.I=x$I, a=x$a, b=x$b)$upper$prob

#  Note that gsBound1 only computes upper bound 
#  To get a lower bound under a parameter value theta:
#      use minus the upper bound as a lower bound
#      replace theta with -theta
#      set probhi as desired lower boundary crossing probabilities 
#  Here we let set lower boundary crossing at 0.05 at each analysis
#  assuming theta=2.2 
y <- gsBound1(theta=-2.2, I=c(1, 2, 3)/3, a= -x$b, 
              probhi=array(.05, 3))
y$b

#  Now use gsProbability to look at design
#  Note that lower boundary crossing probabilities are as
#  specified for theta=2.2, but for theta=0 the upper boundary
#  crossing probabilities are smaller than originally specified
#  above after first interim analysis
gsProbability(k=length(x$b), theta=c(0, 2.2), n.I=x$I, b=x$b, a= -y$b)



