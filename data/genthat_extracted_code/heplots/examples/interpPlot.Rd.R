library(heplots)


### Name: interpPlot
### Title: Plot an Interpolation Between Two Related Data Sets
### Aliases: interpPlot
### Keywords: hplot

### ** Examples

#################################################
# animate an AV plot from marginal to conditional
#################################################
data(Duncan, package="car")
duncmod <- lm(prestige ~ income + education, data=Duncan)
mod.mat <- model.matrix(duncmod)

# function to do an animation for one variable
dunc.anim <- function(variable, other, alpha=seq(0, 1, .1)) {
  var <- which(variable==colnames(mod.mat))
  duncdev <- scale(Duncan[,c(variable, "prestige")], scale=FALSE)
  duncav <- lsfit(mod.mat[, -var], cbind(mod.mat[, var], Duncan$prestige), 
          intercept = FALSE)$residuals
  colnames(duncav) <- c(variable, "prestige")
  
  lims <- apply(rbind(duncdev, duncav),2,range)
  
  for (alp in alpha) {
    main <- if(alp==0) paste("Marginal plot:", variable)
      else paste(round(100*alp), "% Added-variable plot:", variable)
    interpPlot(duncdev, duncav, alp, xlim=lims[,1], ylim=lims[,2], pch=16,
      main = main,
      xlab = paste(variable, "| ", alp, other),
      ylab = paste("prestige | ", alp, other),
      ellipse=TRUE, ellipse.args=(list(levels=0.68, fill=TRUE, fill.alpha=alp/2)), 
      abline=TRUE, id.n=3, id.cex=1.2, cex.lab=1.25)
    Sys.sleep(1)
  }
}

# show these in the R console
if(interactive()) {
dunc.anim("income", "education")

dunc.anim("education", "income")
}

############################################
# correlated bivariate data with 2 outliers
# show rotation from data space to PCA space
############################################

set.seed(123345)
x <- c(rnorm(100), 2, -2)
y <- c(x[1:100] + rnorm(100), -2, 2)
XY <- cbind(x=x, y=y)
rownames(XY) <- seq_along(x)
XY <- scale(XY, center=TRUE, scale=FALSE)

# start, end plots

dataEllipse(XY, pch=16, levels=0.68, id.n=2)
mod <- lm(y~x, data=as.data.frame(XY))
abline(mod, col="red", lwd=2)

pca <- princomp(XY, cor=TRUE)
scores <- pca$scores
dataEllipse(scores, pch=16, levels=0.68, id.n=2)
abline(lm(Comp.2 ~ Comp.1, data=as.data.frame(scores)), lwd=2, col="red")

# show interpolation

# functions for labels, as a function of alpha
main <- function(alpha) {if(alpha==0) "Original data" 
  else if(alpha==1) "PCA scores"
  else paste(round(100*alpha,1), "% interpolation")}
xlab <- function(alpha) {if(alpha==0) "X"
  else if(alpha==1) "PCA.1"
  else paste("X +", alpha, "(X - PCA.1)")}
ylab <- function(alpha) {if(alpha==0) "Y"
  else if(alpha==1) "PCA.2"
  else paste("Y +", alpha, "(Y - PCA.2)")}

interpPCA <- function(XY, alpha = seq(0,1,.1)) {
  XY <- scale(XY, center=TRUE, scale=FALSE)
  if (is.null(rownames(XY))) rownames(XY) <- 1:nrow(XY)
  pca <- princomp(XY, cor=TRUE)
  scores <- pca$scores

  for (alp in alpha) {
    interpPlot(XY, scores, alp, 
      pch=16,
      main = main(alp),
      xlab = xlab(alp),
      ylab = ylab(alp),
      ellipse=TRUE, ellipse.args=(list(levels=0.68, fill=TRUE, fill.alpha=(1-alp)/2)), 
      abline=TRUE, id.n=2, id.cex=1.2, cex.lab=1.25, segments=TRUE)
    Sys.sleep(1)
  }
}

# show in R console
if(interactive()) {
interpPCA(XY)
}

## Not run: 
##D library(animation)
##D saveGIF({
##D   interpPCA(XY, alpha <- seq(0,1,.1))},
##D   movie.name="outlier-demo.gif", ani.width=480, ani.height=480, interval=1.5)
##D 
## End(Not run)





