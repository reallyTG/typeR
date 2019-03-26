library(ISOpureR)


### Name: ISOpure.model_optimize.cg_code.rminimize
### Title: Minimize a differentiable multivariate function
### Aliases: ISOpure.model_optimize.cg_code.rminimize
### Keywords: optimize math

### ** Examples

# Example from Carl E. Rasmussen's webpage

rosenbrock <- function(x){
	D <- length(x);
 	y <- sum(100*(x[2:D] - x[1:(D-1)]^2)^2 + (1-x[1:(D-1)])^2);
 	return(y);
 	};
drosenbrock <- function(x){
	D <- length(x);
	df <- numeric(D);
	df[1:D-1] <- -400*x[1:(D-1)]*(x[2:D]-x[1:(D-1)]^2) - 2*(1-x[1:(D-1)]);
  	df[2:D] <- df[2:D] + 200*(x[2:D]-x[1:(D-1)]^2);
  	return(df);
	};

ISOpure.model_optimize.cg_code.rminimize(c(0,0), rosenbrock, drosenbrock, 25)
#
# [[1]]
# [1] 1 1
#
# [[2]]
#  [1] 1.000000e+00 7.716094e-01 5.822402e-01 4.049274e-01 3.246633e-01
#  [6] 2.896041e-01 7.623420e-02 6.786212e-02 3.378424e-02 1.089908e-03
# [11] 1.087952e-03 8.974308e-05 1.218382e-07 6.756019e-09 3.870791e-15
# [16] 1.035408e-21 6.248025e-27 5.719242e-30 4.930381e-32
#
# [[3]]
# [1] 20



