library(ICAOD)


### Name: sensminimax
### Title: Verifying Optimality of The Minimax and Standardized maximin
###   D-optimal Designs
### Aliases: sensminimax

### ** Examples

##########################
# Power logistic model
##########################
# verifying the minimax D-optimality of a design with points x0 and weights w0
x0 <- c(-4.5515, 0.2130, 2.8075)
w0 <- c(0.4100, 0.3723, 0.2177)
# Power logistic model when s = .2
sensminimax(formula =  ~ (1/(1 + exp(-b * (x-a))))^.2,
            predvars = "x",
            parvars = c("a", "b"),
            family = binomial(),
            x = x0, w = w0,
            lx = -5, ux = 5,
            lp = c(0, 1), up = c(3, 1.5))

##############################
# A model with two predictors
##############################
# Verifying the minimax D-optimality of a design for a model with two predictors
# The model is the mixed inhibition model.
# X0 is the vector of four design points that are:
# (3.4614, 0) (4.2801, 3.1426) (30, 0) (30, 4.0373)
x0 <- c(3.4614, 4.2801, 30, 30, 0, 3.1426, 0, 4.0373)
w0 <- rep(1/4, 4)
sensminimax(formula =  ~ V*S/(Km * (1 + I/Kic)+ S * (1 + I/Kiu)),
            predvars = c("S", "I"),
            parvars = c("V", "Km", "Kic", "Kiu"),
            family = "gaussian",
            x = x0, w = w0,
            lx = c(0, 0), ux = c(30, 60),
            lp = c(1, 4, 2, 4), up = c(1, 5, 3, 5))

##########################################
# Standardized maximin D-optimal designs
##########################################
# Verifying the standardized maximin D-optimality of a design for
# the loglinear model
# First we should define the function for 'localdes' argument
# The function LDOD takes the parameters and returns the points and
# weights of the locally D-optimal design
LDOD <- function(theta0, theta1, theta2){
  ## param is the vector of theta = (theta0, theta1, theta2)
  lx <- 0 # lower bound of the design space
  ux <- 150 # upper bound of the design space
  param <- c()
  param[1] <- theta0
  param[2] <- theta1
  param[3] <- theta2
  xstar <- (ux+param[3]) * (lx + param[3]) *
    (log(ux + param[3]) - log(lx + param[3]))/(ux - lx) - param[3]
  return(list(x = c(lx, xstar, ux) , w = rep(1/3, 3)))
}
x0 <- c(0, 4.2494, 17.0324, 149.9090)
w0 <- c(0.3204, 0.1207, 0.2293, 0.3296)
## Not run: 
##D sensminimax(formula = ~theta0 + theta1* log(x + theta2),
##D             predvars = c("x"),
##D             parvars = c("theta0", "theta1", "theta2"),
##D             x = x0, w = w0,
##D             lx = 0, ux = 150,
##D             lp = c(2, 2, 1), up = c(2, 2, 15),
##D             localdes = LDOD,
##D             standardized = TRUE,
##D             sens.minimax.control = list(answering.set = list(n_seg = 10)))
## End(Not run)
################################################################
# Not necessary!
# The rest of the examples here are only for professional uses.
################################################################
# Imagine you have written your own FIM, say in Rcpp that is faster than
# the FIM created by the formula interface here.

##########################
# Power logistic model
##########################
# For example, th cpp FIM function for the power logistic model is named:
FIM_power_logistic
args(FIM_power_logistic)
# The arguments do not match the standard of the argument 'fimfunc'
# in 'sensminimax'
# So we reparameterize it:
myfim1 <- function(x, w, param)
  FIM_power_logistic(x = x, w = w, param =param, s = .2)

args(myfim1)
## Not run: 
##D # Verify minimax D-optimality of a design
##D sensminimax(fimfunc = myfim1,
##D             x = c(-4.5515, 0.2130, 2.8075),
##D             w = c(0.4100, 0.3723, 0.2177),
##D             lx = -5, ux = 5,
##D             lp = c(0, 1), up = c(3, 1.5))
## End(Not run)
##############################
# A model with two predictors
##############################
# An example of a  model with two-predictors: mixed inhibition model
# Fisher information matrix:
FIM_mixed_inhibition
args(FIM_mixed_inhibition)

# We should first reparameterize the FIM to match the standard of the
# argument 'fimfunc'
myfim2 <- function(x, w, param){
  npoint <- length(x)/2
  S <- x[1:npoint]
  I <- x[(npoint+1):(npoint*2)]
  out <- FIM_mixed_inhibition(S = S, I = I, w = w, param = param)
  return(out)
}
args(myfim2)
## Not run: 
##D # Verifyng minimax D-optimality of a design
##D sensminimax(fimfunc = myfim2,
##D             x = c(3.4614, 4.2801, 30, 30, 0, 3.1426, 0, 4.0373),
##D             w = rep(1/4, 4),
##D             lx = c(0, 0), ux = c(30, 60),
##D             lp = c(1, 4, 2, 4), up = c(1, 5, 3, 5))
## End(Not run)

#########################################
# Standardized maximin D-optimal designs
#########################################
# An example of a user-written FIM function:
help(FIM_loglin)
# An example of verfying standardaized maximin D-optimality for a design
# Look how we re-define the function LDOD above
LDOD2 <- function(param){
  ## param is the vector of theta = (theta0, theta1, theta2)
  lx <- 0 # lower bound of the design space
  ux <- 150 # upper bound of the design space
  xstar <- (ux + param[3]) * (lx + param[3]) *
    (log(ux + param[3]) - log(lx + param[3]))/(ux - lx) - param[3]
  return(list(x = c(lx, xstar, ux) , w = rep(1/3, 3)))
}

args(LDOD2)

sensminimax(fimfunc = FIM_loglin,
            x = x0,
            w = w0,
            lx = 0, ux = 150,
            lp = c(2, 2, 1), up = c(2, 2, 15),
            localdes = LDOD2,
            standardized = TRUE)






