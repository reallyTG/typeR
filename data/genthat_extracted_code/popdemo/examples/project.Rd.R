library(popdemo)


### Name: project
### Title: Project population dynamics
### Aliases: project

### ** Examples

  ### USING PROJECTION OBJECTS

  # Create a 3x3 PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Project stage-biased dynamics of A over 70 intervals
  ( pr <- project(A, vector="n", time=70) )
  plot(pr)

  # Access other slots
  vec(pr)  #time sequence of population vectors
  bounds(pr)  #bounds on population dynamics
  mat(pr)  #matrix used to create projection
  Aseq(pr)  #sequence of matrices (more useful for stochastic projections)
  projtype(pr)  #type of projection
  vectype(pr)  #type of vector(s) initiating projection

  # Extra information on the projection
  nproj(pr)  #number of projections
  nmat(pr)  #number of matrices (more usefulk for stochastic projections)
  ntime(pr)  #number of time intervals
  
  # Select the projection of stage 2 bias
  pr[,2]

  # Project stage-biased dynamics of standardised A over 30 intervals
  ( pr2 <- project(A, vector="n", time=30, standard.A=TRUE) )
  plot(pr2)

  #Select the projection of stage 2 bias
  pr2[,2]

  # Select the density of stage 3 in bias 2 at time 10
  vec(pr2)[11,3,2]

  # Select the time series of densities of stage 2 in bias 1
  vec(pr2)[,2,1]

  #Select the matrix of population vectors for bias 2
  vec(pr2)[,,2]

  # Create an initial stage structure
  ( initial <- c(1,3,2) )

  # Project A over 50 intervals using a specified population structure
  ( pr3 <- project(A, vector=initial, time=50) )
  plot(pr3)

  # Project standardised dynamics of A over 10 intervals using 
  # standardised initial structure and return demographic vectors
  ( pr4 <- project(A, vector=initial, time=10, standard.vec=TRUE, 
                   standard.A=TRUE, return.vec=TRUE) )
  plot(pr4)

  # Select the time series for stage 1
  vec(pr4)[,1]

  ### DETERMINISTIC PROJECTIONS

  # Load the desert Tortoise matrix
  data(Tort)

  # Create an initial stage structure
  Tortvec1 <- c(8, 7, 6, 5, 4, 3, 2, 1)
  
  # Create a projection over 30 time intervals
  ( Tortp1 <- project(Tort, vector = Tortvec1, time = 10) )

  # plot p1
  plot(Tortp1)
  plot(Tortp1, bounds = TRUE) #with bounds
 
  # new display parameters
  plot(Tortp1, bounds = TRUE, col = "red", bty = "n", log = "y", 
       ylab = "Number of individuals (log scale)",
       bounds.args = list(lty = 2, lwd = 2) )

  # multiple vectors
  Tortvec2 <- cbind(Tortvec1, c(1, 2, 3, 4, 5, 6, 7, 8))
  plot(project(Tort, vector = Tortvec2), log = "y")
  plot(project(Tort, vector = Tortvec2), log = "y", labs = FALSE) #no labels

  # dirichlet distribution 
  # darker shading indicates more likely population size
  plot(project(Tort, time = 30, vector = "diri", standard.A = TRUE,
               draws = 500, alpha.draws = "unif"),
       plottype = "shady", bounds = TRUE)
  
  ### STOCHASTIC PROJECTIONS
  # load polar bear data
  data(Pbear)
  
  # project over 50 years with uniform matrix selection
  Pbearvec <- c(0.106, 0.068, 0.106, 0.461, 0.151, 0.108)
  p2 <- project(Pbear, Pbearvec, time = 50, Aseq = "unif")

  # stochastic projection information
  Aseq(p2)
  projtype(p2)
  nmat(p2)
  
  # plot
  plot(p2, log = "y")
  



