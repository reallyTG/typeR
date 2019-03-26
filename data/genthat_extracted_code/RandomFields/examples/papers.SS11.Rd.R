library(RandomFields)


### Name: SS12
### Title: Covariance Models for Random Vector Fields
### Aliases: SS12
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Don't show: ## Not run: 
##D my.legend <- function(lu.x, lu.y, zlim, col, cex=1) {
##D  ## uses already the legend code of R-1.3.0
##D  cn <- length(col)
##D  filler <- vector("character", length=(cn-3)/2)
##D  legend(lu.x, lu.y, y.i=0.03, x.i=0.1, 
##D  legend=c(format(zlim[2], dig=2), filler,
##D  format(mean(zlim), dig=2), filler,
##D  format(zlim[1], dig=2)),
##D  lty=1, col=rev(col),cex=cex)
##D }
##D 
##D my.arrows <- function(xy, z, r, thinning) {
##D  startx <- as.vector(xy[,1] - r/2*z[as.integer(dim(z)[1]/3) + 1,,])
##D  starty <- as.vector(xy[,2] - r/2*z[as.integer(dim(z)[1]/3) + 2,,])
##D  endx <- as.vector(xy[,1] + r/2*z[as.integer(dim(z)[1]/3) + 1,,])
##D  endy <- as.vector(xy[,2] + r/2*z[as.integer(dim(z)[1]/3) + 2,,])
##D  startx[c(rep(TRUE, thinning), FALSE)] <- NA
##D  starty[c(rep(TRUE, thinning), FALSE)] <- NA
##D  endx[c(rep(TRUE, thinning), FALSE)] <- NA
##D  endy[c(rep(TRUE, thinning), FALSE)] <- NA
##D  arrows(x0=startx, y0=starty, x1=endx, y1=endy, length=0.03)
##D }
##D 
##D x <- c(-3, 3, 0.049)
##D nu <- 3
##D col <- grey(seq(0, 1, 0.01)) 
##D thinning <- 21
##D length.arrow <- 1.5 / thinning
##D runif(1)
##D seed <- .Random.seed
##D eps <- FALSE # true falls eps/pdf drucken
##D \dontshow{if(RFoptions()$internal$examples_red){warning("modified <x>"); x <- c(-3, 3, 0.5)}}
##D for (modelname in c("divfree", "curlfree")) {
##D  cat(modelname, "\n")
##D  model <- list(modelname, list("matern", nu=nu))
##D  xx <- seq(x[1], x[2], x[3])
##D  RFoptions(print=2)
##D 
##D  if (!eps) {
##D  cf <- RFcov(model=model, x=cbind(xx, 0))
##D  do.call(getOption("device"), list(height=5, width=5))
##D   j <- 3
##D  plot(xx, cf[(j-1) * length(xx) + (1 : length(xx)), j])
##D  }
##D 
##D  .Random.seed <- seed
##D  z <- RFsimulate(x, x, model=model, n=1, CE.trial=2,
##D  Stor=TRUE, me="ci", print=3, CE.force=!TRUE)
##D  ## z[1,,] : Potentialfeld
##D  ## z[2:3,,] : vectorfeld
##D  ## z[4,,] : div bzw. rot
##D  
##D  if (eps) {
##D  ScreenDevice(height=5, width=5)
##D   } else {
##D  ScreenDevice(height=5, width=10)
##D  par(mfcol=c(1,2))
##D  }
##D  par(mar=c(2.2,2.5,0.5,0.5), cex.axis=2, bg="white")
##D  for (no.vectors in c(TRUE,FALSE)) for (i in c(1,2,4)) {
##D  ## image i=1: Potential feld + Vektorfeld
##D  ## image i=4: div/rot feld + Vektorfeld
##D  if (i==1 || i==4) {
##D  image(xx, xx, col=col, z[i,,] )
##D  if (no.vectors)
##D  my.legend(max(xx) - 0.3 * diff(range(xx)),
##D  min(xx) + 0.3 * diff(range(xx)),
##D  zlim=range(z[i,,]), col=col, cex=1.5)
##D  } else plot(Inf, Inf, xlim=range(xx), ylim=range(xx))
##D 
##D  if (!no.vectors || i!=1 && i!=4) {
##D  xy <- as.matrix(expand.grid(xx, xx))
##D  my.arrows(xy, z, length.arrow, thinning)
##D  }
##D 
##D  if (all(par()$mfcol==1)) {
##D  name <- paste(modelname, "_", nu, "_", !no.vectors, "_", i, sep="")
##D  cat(name,"\n")
##D  dev.copy2eps(file=paste(name, ".eps", sep=""))
##D  dev.copy2pdf(file=paste(name, ".pdf", sep=""))
##D  }
##D  }
##D }
##D 
##D par(mfcol=c(1,1))
##D 
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


