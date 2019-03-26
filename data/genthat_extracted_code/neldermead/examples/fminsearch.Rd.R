library(neldermead)


### Name: fminsearch
### Title: Computation of the unconstrained minimum of given function with
###   the Nelder-Mead algorithm.
### Aliases: fminsearch
### Keywords: method

### ** Examples

#In the following example, we use the fminsearch function to compute the minimum
#of the Rosenbrock function. We first define the function 'banana', and then use
#the fminsearch function to search the minimum, starting with the initial guess
#(-1.2, 1.0). In this particular case, 85 iterations are performed with 159
#function evaluations
  banana <- function(x){
    y <- 100*(x[2]-x[1]^2)^2 + (1-x[1])^2
  }
  sol <- fminsearch(banana, c(-1.2,1))
  sol

#In the following example, we configure the absolute tolerance on the size of
#the simplex to a larger value, so that the algorithm performs less iterations.
#Since the default value of 'TolX' for the fminsearch function is 1.e-4, we
#decide to use 1.e-2. The optimset function is used to create an optimization
#option list and the field 'TolX' is set to 1.e-2. The options list is then
#passed to the fminsearch function as the third input argument. In this
#particular case, the number of iterations is 70 with 130 function evaluations.

  opt <- optimset(TolX=1.e-2)
  sol <- fminsearch(banana, c(-1.2,1), opt)
  sol
  
#In the following example, we want to produce intermediate outputs of the
#algorithm. We define the outfun function, which takes the current point x as
#input argument. The function plots the current point into the current graphic
#window with the plot function. We use the 'OutputFcn' feature of the optimset
#function and set it to the output function. Then the option list is passed 
#to the fminsearch function. At each iteration, the output function is called 
#back, which creates and update a plot. While this example creates a 2D plot,
#the user may customized the output function so that it writes a message in 
#the console, write some data into a data file, etc... The user can distinguish 
#between the output function (associated with the 'OutputFcn' option) and the
#plot function (associated with the 'PlotFcns' option). See the optimset for
#more details on this feature.

  outfun <- function(x, optimValues, state){
    plot(x[1],x[2],xlim=c(-1.5,1.5),ylim=c(-1.5,1.5))
    par(new=TRUE)
  }
  opt <- optimset(OutputFcn=outfun)
  sol <- fminsearch(banana, c(-1.2,1), opt)
  sol

#The 'Display' option allows to get some input about the intermediate steps of
#the algorithm as well as to be warned in case of a convergence problem.
#In the following example, we present what happens in case of a convergence
#problem. We set the number of iterations to 10, instead of the default 400
#iterations. We know that 85 iterations are required to reach the convergence
#criteria. Therefore, the convergence criteria is not met and the maximum number
#of iterations is reached.

  opt <- optimset(MaxIter=10)
  sol <- fminsearch(banana, c(-1.2,1), opt)

#Since the default value of the 'Display' option is 'notify', a message is
#generated, which warns the user about a possible convergence problem. The
#previous script produces the following output.
# Exiting: Maximum number of iterations has been exceeded
#          - increase MaxIter option.
#          Current function value: 4.1355598

#In the following example, we present how to display intermediate steps used by
#the algorithm. We simply set the 'Display' option to the 'iter' value. This 
#option allows to see the number of function evaluations, the minimum function
#value and which type of simplex step is used for the iteration.
  opt <- optimset(Display='iter')
  sol <- fminsearch(banana, c(-1.2,1), opt)
  sol



