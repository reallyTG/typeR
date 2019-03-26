#' Diagnostic in spatio-temporal model with censored/missing responses
#'
#' Return measures and graphics for diagnostic analysis in spatio-temporal model with censored/missing responses.
#'
#' @param Est.StempCens an object of class \code{Est.StempCens} given as output by the \code{\link{EstStempCens}} function. In the \code{EstStempCens}function, \code{IMatrix} must be \code{TRUE}.
#' @param type.diag type of diagnostic: '\code{individual}' is related when one observation is deleted,
#' '\code{time}' is related when an entire time is deleted, '\code{location}' is related when an entire location is deleted and
#' '\code{all}' the three cases ('\code{individual}', '\code{time}' and '\code{location}').
#' By default \code{type.diag} is \code{location}.
#' @param diag.plot \code{TRUE} or \code{FALSE}. It indicates if diagnostic plots must be showed. By default = \code{TRUE}
#' @param ck The value for \code{ck} considered in the benchmark value for the index plot:
#' \eqn{mean(GD)+ck*sd(GD)}, where \eqn{GD} is the vector with all values of the diagnostic measure. By default \code{ck}=3.
#'
#' @details This function uses the case deletion approach to study the impact of deleting one or
#' more observations from the dataset on the parameters estimates, using the idea of Cook (1977). The measure is defined by
#'
#' \eqn{GD_i(\theta*)=(\theta* - \theta*[i])'[-Q**(\theta|\theta*)](\theta* - \theta*[i]), i=1,....m,}
#'
#' where \eqn{\theta*} is the estimate of \eqn{\theta} using the complete data, \eqn{\theta*[i]}
#' are the estimates obtained after deletion of the i-th observation (or group of observations) and
#' \eqn{Q**(\theta|\theta*)} is the Hessian matrix.
#'
#' We can eliminate an observation, an entire location or an entire time index.
#'
#' @return The function returns a list with the diagnostic measures.
#'
#' \describe{
#'   \item{If \code{type.diag == individual | time | location}:}{
#'   \code{GD} is a data.frame with the index value of the observation and the GD measure.}
#'   \item{If \code{type.diag == all}:}{
#'   \code{GDind} is a data.frame with the index value of the observation and the GD measure for individual.
#'
#'   \code{GDtime} is a data.frame with the time index value and the GD measure for time.
#'
#'   \code{GDloc} is a data.frame with the side index value and the GD measure for location.
#'
#'   }
#' }
#'
#' @author Katherine A. L. Valeriano, Victor H. Lachos and Larissa A. Matos
#'
#' @seealso \code{\link{EstStempCens}}
#'
#' @examples
#' # Initial parameter values
#' beta <- c(-1,1.5); phi <- 3; rho <- 0.40; tau2 <- 1; sigma2 <- 2
#' # Simulating data
#' n1 <- 5    # Number of spatial locations
#' n2 <- 5    # Number of temporal index
#' set.seed(700)
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
#' perc <- 0.1
#' aa=sort(y);  bb=aa[1:(perc*n1*n2)];  cutof<-bb[perc*n1*n2]
#' cc=matrix(1,(n1*n2),1)*(y<=cutof)
#' y[cc==1] <- cutof
#' y[17] <- abs(y[17])+2*sd(y)
#' # Estimation
#' est <- EstStempCens(y, x, cc, time2, coord2, inits.phi=2.5, inits.rho=0.5, inits.tau2=0.8,
#'                     type.Data="balanced", cens.type="left", method="nlminb", kappa=0,
#'                     type.S="gaussian",
#'                     IMatrix=TRUE, lower.lim=c(0.01,-0.99,0.01), upper.lim=c(30,0.99,20), M=20,
#'                     perc=0.25, MaxIter=300, pc=0.2, error = 10^-6)
#' # Diagnostic
#' diag <- DiagStempCens(est, type.diag="location", diag.plot = T, ck=1)

DiagStempCens = function(Est.StempCens, type.diag="individual", diag.plot = T, ck=3){

  if(class(Est.StempCens)!="Est.StempCens"){stop("an object of the class Est.StempCens must be provided")}

  if(!is.logical(diag.plot)) stop("diag.plot must be TRUE or FALSE")

  if(type.diag!="all" & type.diag!="time" & type.diag!="individual" & type.diag!="location"){
    stop("type.diag must be all, time, individual,location")
  }

  if(!is.numeric(ck)) stop("the constant ck must be a real number in [0,Inf)")
  if(ck<0) stop("the constant ck must be a real number in [0,Inf)")

  #---------------------------------------------------------------------#
  #                                Outputs                              #
  #---------------------------------------------------------------------#

  if(type.diag=="individual"|type.diag =="time"|type.diag =="location")
  {
    model = Est.StempCens
    GDm = GlobalInf(model, type=type.diag)
    GD = data.frame(x=seq(1,dim(GDm)[1]),y=GDm[,dim(GDm)[2]])
    line <- mean(GD$y)+ck*sd(GD$y)
    GD1 <- ggplot(aes(x=x,y=y),data=GD) +
      geom_point(colour="gray20",size=1.5) +
      labs(x=paste("Index",type.diag),y=expression(GD[i])) +
      geom_line(y=line,colour="gray40",linetype="dotted") +
      geom_text(aes(label=ifelse(GD$y>line,rownames(GD),'')), size=3, vjust=2)

    #out.diag <- list(GD = GD, plotGD = GD1)
    out.diag <- list(GD = GD)

    if(diag.plot == T){print(GD1)}

  }

  if(type.diag=="all")
  {
    model = Est.StempCens
    cat('\n')
    print("type = individual")
    GDm_1  = GlobalInf(model, type="individual")
    cat('\n')
    print("type = time")
    GDm_2  = GlobalInf(model, type="time")
    cat('\n')
    print("type = location")
    GDm_3  = GlobalInf(model, type="location")

    GD_1 = data.frame(x=seq(1,dim(GDm_1)[1]),y=GDm_1[,dim(GDm_1)[2]])
    line1 <- mean(GD_1$y)+ck*sd(GD_1$y)
    GD1 <- ggplot(aes(x=x,y=y),data=GD_1) +
      geom_point(colour="gray20",size=1.5) +
      labs(x="Index individual",y=expression(GD[i])) +
      geom_line(y=line1,colour="gray40",linetype="dotted") +
      geom_text(aes(label=ifelse(GD_1$y>line1,rownames(GD_1),'')), size=3, vjust=2)
    GD_2 = data.frame(x=seq(1,dim(GDm_2)[1]),y=GDm_2[,dim(GDm_2)[2]])
    line2 <- mean(GD_2$y)+ck*sd(GD_2$y)
    GD2 <- ggplot(aes(x=x,y=y),data=GD_2) +
      geom_point(colour="gray20",size=1.5) +
      labs(x="Index time",y=expression(GD[i])) +
      geom_line(y=line2,colour="gray40",linetype="dotted") +
      geom_text(aes(label=ifelse(GD_2$y>line2,rownames(GD_2),'')), size=3, vjust=2)
    GD_3 = data.frame(x=seq(1,dim(GDm_3)[1]),y=GDm_3[,dim(GDm_3)[2]])
    line3 <- mean(GD_3$y)+ck*sd(GD_3$y)
    GD3 <- ggplot(aes(x=x,y=y),data=GD_3) +
      geom_point(colour="gray20",size=1.5) +
      labs(x="Index location",y=expression(GD[i])) +
      geom_line(y=line3,colour="gray40",linetype="dotted") +
      geom_text(aes(label=ifelse(GD_3$y>line3,rownames(GD_3),'')), size=3, vjust=2)

    out.diag<- list(GDind = GD_1, GDtime = GD_2, GDloc = GD_3)

    if(diag.plot == T){
      pushViewport(viewport(layout = grid.layout(2, 2)))
      print(GD2, vp = vplayout(1, 1))
      print(GD3, vp = vplayout(1, 2))
      print(GD1, vp = vplayout(2, c(1,2)))
    }

  }

  class(out.diag) <- "Diag.StempCens"

  return(invisible(out.diag))

}

