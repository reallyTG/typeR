#' Covariance matrix for spatio-temporal model
#'
#' It computes the spatio-temporal covariance matrix. For the spatial function we have 5 differents correlation matrix:
#' exponential, gaussian, matern, spherical and power exponential correlation matrix; and for the temporal function is
#' a correlation matrix of an autorregressive model AR(1).
#'
#' @param phi value of the spatial scaling parameter.
#' @param rho value of the time scaling parameter.
#' @param tau2 value of the the nugget effect parameter.
#' @param sigma2 value of the the model variance.
#' @param distSpa Spatial distance matrix without considering repetitions.
#' @param disTemp Temporal distance matrix without considering repetitions.
#' @param type.S type of spatial covariance function: '\code{exponential}' for exponential, '\code{gaussian}' for gaussian,
#' '\code{matern}' for matern, '\code{pow.exp}' for power exponential and '\code{spherical}' for spherical function, respectively.
#' Default is \code{exponential} function.
#' @param kappa  parameter for all spatial covariance functions. In the case of exponential, gaussian and spherical function \eqn{\kappa} is equal to zero.
#'
#' @return The function returns the spatio-temporal covariance matrix.
#'
#' @author Katherine A. L. Valeriano, Victor H. Lachos and Larissa A. Matos
#'
#' @examples
#' # Initial parameter values
#' beta <- c(-1,1.50); phi <- 5; rho <- 0.45; tau2 <- 0.80; sigma2 <- 2
#' # Simulating data
#' n1 <- 10   # Number of spatial locations
#' n2 <- 5    # Number of temporal index
#' set.seed(1000)
#' x.coord <- round(runif(n1,0,10),9)    # X coordinate
#' y.coord <- round(runif(n1,0,10),9)    # Y coordinate
#' coordenadas <- cbind(x.coord,y.coord) # Cartesian coordinates without repetitions
#' time <- as.matrix(seq(1,n2,1))        # Time index without repetitions
#' # Covariance matrix
#' H <- as.matrix(dist(coordenadas)) # Spatial distances
#' Mt <- as.matrix(dist(time))       # Temporal distances
#' Cov <- CovarianceM(phi,rho,tau2,sigma2,distSpa=H,disTemp=Mt,kappa=0,type.S="exponential")

CovarianceM = function(phi, rho, tau2, sigma2, distSpa, disTemp, kappa, type.S){

  if (phi <= 0){stop("The spatial parameter can not be negative or equal to zero")}
  if (rho>1 | rho<(-1)){stop("The time scaling parameter can not be >1 or < -1")}
  if (tau2 < 0){stop("The nugget effect can not be negative")}
  if (sigma2 < 0){stop("The model variance parameter can not be negative")}
  if (ncol(distSpa) != nrow(distSpa)) stop("Spatial distance matrix must be specified")
  if (ncol(disTemp) != nrow(disTemp)) stop("Temporal distance matrix must be specified")
  if (kappa<0) stop("kappa must be a real number in [0,Inf)")
  if (type.S!="matern" & type.S !="gaussian" & type.S != "spherical" & type.S != "pow.exp" & type.S != "exponential") {
    stop('type.S should be one of matern, gaussian, spherical, pow.exp, exponential')}

  #---------------------------------------------------------------------#
  #                                Outputs                              #
  #---------------------------------------------------------------------#

  Covariance <- CovM(phi, rho, tau2, sigma2, distSpa, disTemp, kappa, type.S)

  out.ST <- Covariance

 return(invisible(out.ST))

}
