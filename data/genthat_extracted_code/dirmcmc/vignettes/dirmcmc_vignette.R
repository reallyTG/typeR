### R code from vignette source 'dirmcmc_vignette.Rnw'

###################################################
### code chunk number 1: setup
###################################################
library(knitr)
# set global chunk options
opts_chunk$set(fig.path='figure/minimal-', fig.align='center', fig.show='hold')
options(formatR.arrow=TRUE,width=90)


###################################################
### code chunk number 2: banana
###################################################
library(dirmcmc)
lupost.banana <- function(x,B){
  -x[1]^2/200 - 1/2*(x[2]+B*x[1]^2-100*B)^2
}

##Banana Gradient
gr.banana <- function(x,B){
  g1 <- -x[1]/100 - 2*B*(x[2]+B*x[1]^2-100*B)
  g2 <- -(x[2]+B*x[1]^2-100*B)
  g <- c(g1,g2)
  return(g)
}
B <- 0.03
x1 <- seq(-25, 25, length=120)
x2 <- seq(-25, 25, length=120)
d.banana <- matrix(apply(expand.grid(x1, x2), 1, 
                         lupost.banana, B=B), nrow=120)
image(x1, x2, exp(d.banana), col=cm.colors(60), asp=1, main="MH")
contour(x1, x2, exp(d.banana), add=TRUE, col=gray(0.6))
out.metdir.banana <- metropdir(obj = lupost.banana, dobj = gr.banana,
                             initial = c(0,1),lchain = 2000,
                             sd.prop=1.5,
                             steplen=0.01,s=1.1,B=B)
plot(out.metdir.banana$batch,xlab="x1",ylab = "x2",cex=0.5)


###################################################
### code chunk number 3: bananaresult
###################################################
out.metdir.banana$accept
apply(out.metdir.banana$batch,2,mean)


###################################################
### code chunk number 4: bananaAdapt
###################################################
out.metdir.adapt.banana <- metropdir.adapt(obj = lupost.banana, 
                                           dobj = gr.banana,
                             initial = c(0,1),lchain = 2000,
                             sd.prop=1.5,
                             steplen=0.01,s=1.1,targetacc = 0.44,B=B)
image(x1, x2, exp(d.banana), col=cm.colors(60), asp=1, main="MH")
contour(x1, x2, exp(d.banana), add=TRUE, col=gray(0.6))
plot(out.metdir.adapt.banana$batch,xlab="x1",ylab = "x2",cex=0.5)


###################################################
### code chunk number 5: diag
###################################################
mcmcdiag(out.metdir.adapt.banana$batch)


