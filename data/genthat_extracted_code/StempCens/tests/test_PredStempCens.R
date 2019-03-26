#' Prediction in spatio-temporal model with censored/missing responses
#'
#' This function performs spatio-temporal prediction in a set of new S spatial locations for fixed time points.
#'
#' @param Est.StempCens an object of class \code{Est.StempCens} given as output by the \code{\link{EstStempCens}} function.
#' @param locPre a matrix of coordinates for which the spatial prediction is performed.
#' @param timePre the time point between 1 and n for which the spatial prediction is performed.
#' @param xPre a matrix of covariates for which the spatial prediction is performed.
#'
#' @return The function returns an object of class \code{Pred.StempCens} which is a list given by:
#'
#' \item{predValues}{predicted values.}
#' \item{VarPred}{predicted covariance matrix.}
#'
#' @author Katherine A. L. Valeriano, Victor H. Lachos and Larissa A. Matos
#'
#' @seealso \code{\link{EstStempCens}}
#'
#' @examples
#' # Initial parameter values
#' beta <- c(-1,1.50); phi <- 5; rho <- 0.6; tau2 <- 0.80; sigma2 <- 2
#' # Simulating data
#' n1 <- 7    # Number of spatial locations
#' n2 <- 5    # Number of temporal index
#' set.seed(400)
#' x.coord <- round(runif(n1,0,10),9)   # X coordinate
#' y.coord <- round(runif(n1,0,10),9)   # Y coordinate
#' coordenadas <- cbind(x.coord,y.coord) # Cartesian coordinates without repetitions
#' coord2 <- cbind(rep(x.coord,each=n2),rep(y.coord,each=n2)) # Cartesian coordinates with repetitions
#' time <- as.matrix(seq(1,n2,1))   # Time index without repetitions
#' time2 <- as.matrix(rep(time,n1)) # Time index with repetitions
#' x1 <- rexp(n1*n2,2)
#' x2 <- rnorm(n1*n2,2,1)
#' x <- cbind(x1,x2)
#' media <- x%*%beta
#' # Covariance matrix
#' H <- as.matrix(dist(coordenadas)) # Spatial distances
#' Mt <- as.matrix(dist(time))       # Temporal distances
#' Cov <- CovarianceM(phi,rho,tau2,sigma2,distSpa=H,disTemp=Mt,kappa=0,type.S="gaussian")
#' # Data
#' y <- as.vector(rmvnorm(1,mean=as.vector(media),sigma=Cov))
#' data <- as.data.frame(cbind(coord2,time2,y,x))
#' names(data) <- c("x.coord","y.coord","time","yObs","x1","x2")
#' # Splitting the dataset
#' local.est <- coordenadas[c(1,2,4,5,6),]
#' data.est <- data[data$x.coord%in%local.est[,1]&data$y.coord%in%local.est[,2],]
#' data.valid <- data[data$x.coord%in%coordenadas[c(3,7),1]&data$y.coord%in%coordenadas[c(3,7),2],]
#' # Censored
#' perc <- 0.2
#' y <- data.est$yObs
#' aa=sort(y);  bb=aa[1:(perc*nrow(data.est))];  cutof<-bb[perc*nrow(data.est)]
#' cc=matrix(1,nrow(data.est),1)*(y<=cutof)
#' y[cc==1] <- cutof
#' data.est <- cbind(data.est[,-c(4,5,6)],y,cc,data.est[,c(5,6)])
#' names(data.est) <- c("x.coord","y.coord","time","yObs","censored","x1","x2")
#' # Estimation
#' y <- data.est$yObs
#' x <- cbind(data.est$x1,data.est$x2)
#' cc <- data.est$censored
#' time2 <- as.data.frame(data.est$time)
#' coord2 <- data.est[,1:2]
#' est_teste <- EstStempCens(y, x, cc, time2, coord2, inits.phi=3.5, inits.rho=0.5, inits.tau2=1,
#'                           type.Data="balanced", cens.type="left", method="nlminb", kappa=0,
#'                           type.S="gaussian",
#'                           IMatrix=TRUE, lower.lim=c(0.01,-0.99,0.01), upper.lim=c(30,0.99,10), M=20,
#'                           perc=0.25, MaxIter=300, pc=0.2, error = 10^-6)
#' class(est_teste)
#' # Prediction
#' locPre <- data.valid[,1:2]
#' timePre <- as.data.frame(data.valid$time)
#' xPre <- cbind(data.valid$x1,data.valid$x2)
#' pre_teste <- PredStempCens(est_teste, locPre, timePre, xPre)
#' library(ggplot2)
#' Model <- rep(c("y Observed","y Predicted"),each=10)
#' xcoord1 <- rep(seq(1:5),4)
#' ycoord1 <- c(data.valid$yObs,pre_teste$predValues)
#' data2 <- data.frame(Model,xcoord1,ycoord1)
#' # Station 1
#' fig1 <- ggplot(data=data2[c(1:5,11:15),], aes(x=xcoord1, y=ycoord1)) +
#'            geom_line(aes(color=Model),show.legend=F) +
#'            labs(x="",y="",title="Station 1")
#' # Station 2
#' fig2 <- ggplot(data=data2[c(6:10,16:20),], aes(x=xcoord1, y=ycoord1)) +
#'            geom_line(aes(color=Model),show.legend=T) +
#'            theme(legend.position="bottom") +
#'            labs(x="",y="",title="Station 2")
#' library(gridExtra)
#' grid.arrange(fig1,fig2)

PredStempCens = function(Est.StempCens, locPre, timePre, xPre){

  if(class(Est.StempCens)!="Est.StempCens"){stop("an object of the class Est.StempCens must be provided")}

  #---------------------------------------------------------------------#
  #                                Outputs                              #
  #---------------------------------------------------------------------#

  model = Est.StempCens
  ypred <- PredictNewValues(model,locPre,timePre,xPre)

  out.ST <-ypred

 class(out.ST) <- "Pred.StempCens"

 return(invisible(out.ST))

}




