#' ML estimation in spatio-temporal model with censored/missing responses
#'
#' Return the maximum likelihood estimates of the unknown parameters of spatio-temporal model with censored/missing responses.
#' The estimates are obtained using SAEM algorithm.
#' Also, the function computes the observed information matrix using the method developed by Thomas (1982).
#' The types of censoring considered are left, right or missing values.
#'
#' @param y a vector of responses.
#' @param x a matrix or vector of covariates.
#' @param cc a vector of censoring indicators. For each observation: 1 if censored/missing and 0 if non-censored/non-missing.
#' @param tempo a vector of time.
#' @param coord a matrix of coordinates of the spatial locations.
#' @param inits.phi initial value of the spatial scaling parameter.
#' @param inits.rho initial value of the time scaling parameter.
#' @param inits.tau2 initial value of the the nugget effect parameter.
#' @param tau2.fixo \code{TRUE} or \code{FALSE}. Indicate if the nugget effect (\eqn{\tau^2}) parameter must be fixed.
#' By default = \code{FALSE}.
#' @param method optimization method used to estimate (\eqn{\phi}, \eqn{\rho} and \eqn{\tau^2}):
#' '\code{optim}' for the function \code{\link[stats]{optim}} and '\code{nlminb}' for the function \code{\link[stats]{nlminb}}.
#' By default = \code{nlminb}.
#' @param lower.lim,upper.lim vectors of lower and upper bounds for the optimization method.
#' If unspecified, the default is \code{c(0.01,-0.99,0.01)} for the lower bound and \code{c(30,0.99,20)} for the upper bound.
#' @param type.Data type of the data: '\code{balanced}' for balanced data and '\code{unbalanced}' for unbalanced data. By default = \code{balanced}.
#' @param cens.type type of censoring: '\code{left}' for left censoring, '\code{right}' for rigth censoring and '\code{missing}' for missing response.
#' By default = \code{left}.
#' @param type.S type of spatial covariance function: '\code{exponential}' for exponential, '\code{gaussian}' for gaussian,
#' '\code{matern}' for matern, '\code{pow.exp}' for power exponential and '\code{spherical}' for spherical function, respectively.
#' Default is \code{exponential} function.
#' @param kappa parameter for all spatial covariance functions. In the case of exponential, gaussian and spherical function \eqn{\kappa} is equal to zero.
#' @param IMatrix \code{TRUE} or \code{FALSE}. Indicate if the observed information matrix will be computed. By default = \code{TRUE}.
#' @param M number of Monte Carlo samples for stochastic aproximation. By default = 20.
#' @param perc percentage of burn-in on the Monte Carlo sample. By default = 0.25.
#' @param MaxIter the maximum number of iterations of the SAEM algorithm. By default = 300.
#' @param pc percentage of iterations of the SAEM algorithm with no memory.  By default = 0.2
#' @param error the convergence maximum error. By default = 10^-6.
#'
#' @details The spatio-temporal Gaussian model is giving by:
#'
#' \eqn{ Y(s_{i},t_{j})= \mu(s_{i},t_{j})+ Z(s_{i},t_{j}) +  \epsilon(s_{i},t_{j}),}
#'
#' where, the deterministic term \eqn{\mu(s_{i},t_{j})} and the stochastic terms \eqn{Z(s_{i},t_{j})},
#' \eqn{\epsilon(s_{i},t_{j})} can depend on the observed spatio-temporal index for \eqn{Y(s_{i},t_{j})}.
#' We assume \eqn{Z} is normally distributed with zero-mean and covariance matrix \eqn{\Sigma_z = \sigma^2 \Omega_{\phi\rho}(s,t)}
#' where \eqn{\sigma^2} is the model variance, \eqn{\phi} and \eqn{\rho} are the spatial and time scaling parameters;
#' \eqn{\epsilon(s_i,t_j)} is an independent and identically distributed measurement error with
#' \eqn{E[\epsilon(s_i,t_j)]=0}, variance function \eqn{Var[\epsilon(s_i,t_j)]=\tau^2} (the nugget effect) and
#' \eqn{Cov[\epsilon(s_i,t_j), \epsilon(s_k,t_l)]=0} \eqn{for all s_i =! s_k} and \eqn{t_j =! t_l}.
#'
#' In particular, we define \eqn{\mu(s_i,t_j)}, the mean of the stochastic process as
#'
#' \eqn{\mu(s_i,t_j)=\sum_{k=1}^{p} x_k(s_i,t_j)\beta_k,}
#'
#' where \eqn{x_1(s_i,t_j),..., x_p(s_i,t_j)} are known functions of \eqn{(s_i,t_j)}, and \eqn{\beta_1,...,\beta_p}
#' are unknown parameters to be estimated. Equivalently, in matrix notation, we have our spatio-temporal linear model as follows:
#'
#' \eqn{Y = X \beta + Z + \epsilon,}
#'
#' \eqn{Z ~ N(0,\sigma^2 \Omega_{\phi\rho}),}
#'
#' \eqn{\epsilon ~ N(0,\tau^2 I).}
#'
#' Therefore the spatio-temporal process, \eqn{Y}, has normal distribution with mean \eqn{E[Y]=X\beta} and
#' variance \eqn{\Sigma=\sigma^2\Omega_{\phi\rho}+\tau^2 I_m}. We assume that \eqn{\Sigma} is non-singular, and \eqn{X} has full rank.
#' Using standard geostatistical terms, \eqn{\tau^2} is the nugget effect (or the measurement error variance), \eqn{\sigma^2} the sill, and
#' \eqn{\Omega_{\phi\rho}=[r_{ij}]} is the \eqn{m x m} spatio-temporal correlation matrix with diagonal elements
#' \eqn{r_{ii}=1}, for \eqn{i=1,...,m}.
#'
#' The estimation process was computed via SAEM algorithm initially proposed by Deylon et. al.(1999).
#'
#' @return The function returns an object of class \code{Est.StempCens} which is a list given by:
#'
#'\describe{
#'   \item{data.model}{Returns a list with all data components given in input.}
#'   \item{results.model}{A list given by:}
#' }
#'   \item{theta}{final estimation of \eqn{\theta = (\beta, \sigma^2, \tau^2, \phi, \rho)}.}
#'   \item{Theta}{estimated parameters in all iterations, \eqn{\theta = (\beta, \sigma^2, \tau^2, \phi, \rho)}.}
#'   \item{beta}{estimated \eqn{\beta}.}
#'   \item{sigma2}{estimated \eqn{\sigma^2}.}
#'   \item{tau2}{estimated \eqn{\tau^2}.}
#'   \item{phi}{estimated \eqn{\phi}.}
#'   \item{rho}{estimated \eqn{\rho}.}
#'   \item{PsiInv}{estimated \eqn{\Psi^-1}.}
#'   \item{Cov}{estimated \eqn{\Sigma}.}
#'   \item{SAEMy}{stochastic approximation of the first moment for the truncated normal distribution.}
#'   \item{SAEMyy}{stochastic approximation of the second moment for the truncated normal distribution.}
#'   \item{Hessian}{Hessian matrix, the negative of the conditional expected second derivative matrix given the observed values.}
#'   \item{Louis}{the observed information matrix using the Louis' method.}
#'   \item{loglik}{log likelihood for SAEM method.}
#'   \item{AIC}{Akaike information criteria.}
#'   \item{BIC}{Bayesian information criteria.}
#'   \item{AICcorr}{corrected AIC by the number of parameters.}
#'   \item{iteration}{number of iterations needed to convergence.}
#'
#' @author Katherine A. L. Valeriano, Victor H. Lachos and Larissa A. Matos
#'
#' @examples
#' # Initial parameter values
#' beta <- c(-1,1.50); phi <- 5; rho <- 0.45; tau2 <- 0.80; sigma2 <- 1.5
#' # Simulating data
#' n1 <- 5    # Number of spatial locations
#' n2 <- 5    # Number of temporal index
#' set.seed(1000)
#' x.coord <- round(runif(n1,0,10),9)   # X coordinate
#' y.coord <- round(runif(n1,0,10),9)   # Y coordinate
#' coordenadas <- cbind(x.coord,y.coord) # Cartesian coordinates without repetitions
#' coord2 <- cbind(rep(x.coord,each=n2),rep(y.coord,each=n2)) # Cartesian coordinates with repetitions
#' time <- as.matrix(seq(1,n2,1))      # Time index without repetitions
#' time2 <- as.matrix(rep(time,n1))    # Time index with repetitions
#' x1 <- rexp(n1*n2,2)
#' x2 <- rnorm(n1*n2,2,1)
#' x <- cbind(x1,x2)
#' media <- x%*%beta
#' # Covariance matrix
#' H <- as.matrix(dist(coordenadas)) # Spatial distances
#' Mt <- as.matrix(dist(time))       # Temporal distances
#' Cov <- CovarianceM(phi,rho,tau2,sigma2,distSpa=H,disTemp=Mt,kappa=0,type.S="exponential")
#' # Data
#' y <- as.vector(rmvnorm(1,mean=as.vector(media),sigma=Cov))
#' perc <- 0.2
#' aa=sort(y);  bb=aa[1:(perc*n1*n2)];  cutof<-bb[perc*n1*n2]
#' cc=matrix(1,(n1*n2),1)*(y<=cutof)
#' y[cc==1] <- cutof
#' # Estimation
#' est_teste <- EstStempCens(y, x, cc, time2, coord2, inits.phi=3.5, inits.rho=0.5, inits.tau2=0.7,
#'                           type.Data="balanced", cens.type="left", method="nlminb", kappa=0,
#'                           type.S="exponential",
#'                           IMatrix=TRUE, lower.lim=c(0.01,-0.99,0.01), upper.lim=c(30,0.99,20), M=20,
#'                           perc=0.25, MaxIter=300, pc=0.2, error = 10^-6)
#'
#' \dontrun{
#' library(spTimer)
#' library(sp)
#' library(rgdal)
#' # Transform coordinates
#' station <- as.data.frame(NYdata[,2:3])
#' names(station) <- c("lon","lat")
#' coordinates(station) <- ~lon+lat
#' proj4string(station) <- CRS("+init=epsg:32116 +proj=longlat +datum=NAD83 +no_defs
#'                              +ellps=GRS80 +towgs84=0,0,0")
#' station2 <- spTransform(station,CRS("+proj=utm +zone=18 +north +datum=NAD83"))
#' station <- as.data.frame(station2)
#' names(station) <- c("x.Coord","y.Coord")
#' NYdata <- cbind(NYdata,station)
#' coord <- unique(station)
#' EstEstimation <- c(1,2,3,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,22,23,24,26,27,28)
#' EstEstimation <- coord[EstEstimation,]
#' dataEstimation <- NYdata[(NYdata[,11]%in%EstEstimation[,1])&(NYdata[,12]%in%EstEstimation[,2]),]
#' cc <- vector("numeric",length=nrow(dataEstimation))
#' cc[is.na(dataEstimation$o8hrmax)==1] <- 1
#' time <- rep(seq(1,62),nrow(EstEstimation))
#'dados <- cbind(dataEstimation,cc,time)
#' names(dados) <- c("s.index","Longitude","Latitude","Year","Month","Day","o8hrmax","cMAXTMP",
#'                   "WDSP","RH","x.Coord","y.Coord","censure","time")
#' # Data
#' y     <- dados$o8hrmax
#' cc    <- dados$censure
#' x     <- as.matrix(cbind(dados$cMAXTMP,dados$WDSP,dados$RH))
#' tempo <- as.data.frame(dados$time)
#' coord <- as.matrix(cbind(dados$x.Coord/1000,dados$y.Coord/1000)) # Coordinates in Km
#' # Power exponential model for the spatial covariance structure
#' est <- EstStempCens(y, x, cc, tempo, coord, inits.phi = 50, inits.rho = 0.30, inits.tau2 = 25,
#'                     type.Data="balanced", cens.type="missing", method="nlminb", kappa=0.50,
#'                     type.S="pow.exp",
#'                     IMatrix=TRUE, lower.lim=c(0.01,-0.80,0.01), upper.lim=c(500,0.80,150), M=20,
#'                     perc=0.25, MaxIter=500, pc=0.2, error = 10^-5)}
#' @import ssym
#' @import optimx
#' @import Matrix
#' @import sp
#' @import spTimer
#' @import mvtnorm
#' @import tmvtnorm
#' @import MCMCglmm
#' @import ggplot2
#' @import grid
#' @import distances
#' @import gridExtra
#'
#' @importFrom stats dnorm nlminb optim optimize sd dist
#' @importFrom utils setTxtProgressBar txtProgressBar
#'
#' @export CovarianceM
#' @export EstStempCens
#' @export DiagStempCens
#' @export PredStempCens
#' @export CrossStempCens

EstStempCens = function(y, x, cc, tempo, coord, inits.phi, inits.rho, inits.tau2, tau2.fixo=FALSE,
                     type.Data="balanced", cens.type="left", method="nlminb", kappa=0, type.S="exponential",
                     IMatrix=TRUE, lower.lim=c(0.01,-0.99,0.01), upper.lim=c(30,0.99,20), M=20,
                     perc=0.25, MaxIter=300, pc=0.2, error = 10^-6)
{

  #---------------------------------------------------------------------#
  #                              Validations                            #
  #---------------------------------------------------------------------#

  ly <- length(y)
  if (nrow(x)!=ly){stop("Number of rows in x is different to the number of observations in y")}

  if (length(cc)!=ly){stop("Length of censored vector (cc) different to the length of y")}

  if (nrow(tempo)!=ly){stop("Number of elements in time vector is not equal to the number of observations in y")}

  if (nrow(coord)!=ly|ncol(coord)!=2){stop("Dimension of coordinate matrix is non-confortable")}

  if (inits.phi <= 0){stop("The spatial parameter can not be negative or equal to zero")}

  if (inits.rho > 1 | inits.rho < (-1)){stop("The time scaling parameter can not be >1 or < -1")}

  if (inits.tau2 < 0){stop("The nugget effect can not be negative")}

  if (length(lower.lim)!=length(upper.lim) | length(lower.lim) > 3){stop("non-confortable vector to the limits")}

  if (tau2.fixo=="FALSE"){
    if(length(lower.lim)!=3 | length(upper.lim)!=3){stop("Number of elements to the limits different of 3")}
    if(upper.lim[1]<=lower.lim[1] | lower.lim[1]<0){stop("Non-confortable values to the limits of the spatial parameter")}
    if(upper.lim[2]<=lower.lim[2] | lower.lim[2]<(-1) | upper.lim[2]>1){stop("Non-confortable values to the limits of the temporal parameter")}
    if(upper.lim[3]<=lower.lim[3] | lower.lim[3]<0){stop("Non-confortable values to the limits of the nugget effect")}
  }

  if (tau2.fixo=="TRUE"){
    if(length(lower.lim)!=2 | length(upper.lim)!=2){stop("Number of elements to the limits different of 3")}
    if(upper.lim[1]<=lower.lim[1] | lower.lim[1]<0){stop("Non-confortable values to the limits of the spatial parameter")}
    if(upper.lim[2]<=lower.lim[2] | lower.lim[2]<(-1) | upper.lim[2]>1){stop("Non-confortable values to the limits of the temporal parameter")}
  }

  if (perc > 1 | perc<=0){stop("Invalid value for perc")}

  if (pc > 1 | pc<=0){stop("Invalid value for pc")}

  # Validation, type of censoring

  if( (cens.type != "left") && (cens.type != "right") && (cens.type != "missing"))  stop("Censoring not recognized: 'left' for left censoring, 'right' for right censoring or 'missing' for missing observations.")

  # Validation, arguments support of the function

  if(MaxIter <= 0 | MaxIter%%1 != 0) stop("iter.max must be a positive integer.")

  if(error <=0 | error > 1) stop("error must belong to the interval (0,1]")

  if(!is.logical(tau2.fixo) | !is.logical(IMatrix)) stop("Parameters tau2.fixo and IMatrix must be logical (TRUE/FALSE) variables.")


  #---------------------------------------------------------------------#
  #                                Outputs                              #
  #---------------------------------------------------------------------#


  out.ST = saemST(y,x,cc,tempo,coord,inits.phi,inits.rho,inits.tau2,tau2.fixo,type.Data,cens.type,method,kappa,
                  type.S,IMatrix,lower.lim,upper.lim,M,perc,MaxIter,pc,error)

  betas  = round(out.ST$m.results$beta, 4)
  sigma2 = round(out.ST$m.results$sigma2, 4)
  tau2   = round(out.ST$m.results$tau2, 4)
  phi    = round(out.ST$m.results$phi, 4)
  rho    = round(out.ST$m.results$rho, 4)
  theta  = round(out.ST$m.results$theta, 4)

  # Criteria
  Loglik = out.ST$m.results$loglik
  AIC    = out.ST$m.results$AIC
  AICc   = out.ST$m.results$AICcorr
  BIC    = out.ST$m.results$BIC

  if(IMatrix==TRUE){

    MI_obs = sqrt(diag(solve(out.ST$m.results$Louis)))
    SEbeta   = MI_obs[1:length(betas)]
    SEsigma2 = MI_obs[length(betas)+1]
    SEtau2   = MI_obs[length(betas)+2]
    SEphi   = MI_obs[length(betas)+3]
    SErho   = MI_obs[length(betas)+4]
    SE       = round(c(SEbeta,SEsigma2,SEtau2,SEphi,SErho), 4)

    Estimates      = cbind(theta,SE)
    colx           = ncol(as.matrix(x))

    namesx = paste0('\u03b2',1)
    if(ncol(as.matrix(x))>1)
    {
      for(i in 2:ncol(as.matrix(x))){namesx = cbind(namesx, paste0('\u03b2',i))}
    }

    greeks = c(sigma='\u03c3\u00B2', tau='\u03C4\u00B2', phi='\u03D5', rho='\u03C1')
    dimnames(Estimates) = list(c(namesx[1:colx],paste0(greeks)),c("Estimates", "SE"))

    cat('\n')
    cat('---------------------------------------------------------------\n')
    cat('     Spatio-temporal models for censored/missing responses     \n')
    cat('---------------------------------------------------------------\n')
    print(Estimates)

     cat('--------------------------------------------------------------\n')
     cat('\r \n')
     criteriaPCR = c(Loglik, AIC, AICc, BIC)
     criteriaFin = round(as.matrix(criteriaPCR),digits=3)
     dimnames(criteriaFin) = list(c("Loglik.", "AIC", "AICcorr.", "BIC"),c("Value"))
     cat('\n')
     cat('Model selection criteria\n')
     cat('------------------------------------\n')
     print(criteriaFin)
     cat('------------------------------------\n')
     cat('\r \n')
  }

  if(IMatrix==FALSE){

    Estimates      = matrix(theta,ncol=1)
    colx           = ncol(as.matrix(x))

    namesx = paste0('\u03b2',1)
    if(ncol(as.matrix(x))>1)
    {
      for(i in 2:ncol(as.matrix(x))){namesx = cbind(namesx, paste0('\u03b2',i))}
    }

    greeks = c(sigma='\u03c3\u00B2', tau='\u03C4\u00B2', phi='\u03D5', rho='\u03C1')
    dimnames(Estimates) = list(c(namesx[1:colx],paste0(greeks)),c("Estimates"))

    cat('\n')
    cat('---------------------------------------------------------------\n')
    cat('     Spatio-temporal models for censored/missing responses     \n')
    cat('---------------------------------------------------------------\n')
    print(Estimates)

    cat('--------------------------------------------------------------\n')
    cat('\r \n')
    criteriaPCR = c(Loglik, AIC, AICc, BIC)
    criteriaFin = round(as.matrix(criteriaPCR),digits=3)
    dimnames(criteriaFin) = list(c("Loglik.", "AIC", "AICcorr.", "BIC"),c("Value"))
    cat('\n')
    cat('Model selection criteria\n')
    cat('------------------------------------\n')
    print(criteriaFin)
    cat('------------------------------------\n')
    cat('\r \n')
  }

   class(out.ST) <- "Est.StempCens"

   return(invisible(out.ST))

}

