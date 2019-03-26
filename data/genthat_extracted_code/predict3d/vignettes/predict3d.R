## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = NA,
  fig.height=7,
  fig.width=7
)

## ----eval=FALSE----------------------------------------------------------
#  if(!require(devtools)) install.packages("devtools")
#  devtools::install_github("cardiomoon/predict3d"")

## ----message=FALSE-------------------------------------------------------
require(predict3d)
require(rgl)
fit1=lm(Sepal.Length~Sepal.Width*Species,data=iris)
fit1

## ------------------------------------------------------------------------
ggPredict(fit1,digits=1)
predict3d(fit1,radius=0.05)
rglwidget(elementId = "1st")

## ------------------------------------------------------------------------
fit2=lm(mpg~wt*hp,data=mtcars)
ggPredict(fit2,labels=paste0("label",1:3),xpos=c(0.3,0.4,0.3))
predict3d(fit2,radius=3,palette=NULL,show.error=TRUE)
rglwidget(elementId = "2nd")


## ---- fig.height=5,fig.width=8,message=FALSE,warning=FALSE---------------
require(TH.data)
fit3=glm(cens~pnodes*age*horTh,data=GBSG2,family=binomial)
ggPredict(fit3,se=TRUE,show.text = FALSE)
predict3d(fit3,radius=0.5)
rglwidget(elementId = "3rd")

## ------------------------------------------------------------------------
fit=loess(mpg~hp*wt,data=mtcars)
ggPredict(fit)
predict3d(fit,radius=3)
rglwidget(elementId = "4th")

## ----eval=FALSE----------------------------------------------------------
#  start <- proc.time()[3]
#  while ((i <- 36*(proc.time()[3] - start)) < 360) {
#       rgl.viewpoint(i, i/4);
#  }
#  play3d(spin3d(axis = c(1, 0, 0), rpm = 30), duration = 2)

## ----eval=FALSE----------------------------------------------------------
#  rgl.bringtotop()
#  rgl.snapshot("fig1.png")
#  rgl.postscript("fig2.pdf","pdf")

## ---- eval=FALSE---------------------------------------------------------
#  movie3d(spin3d(axis = c(0, 0, 1)),dir=".", duration = 3,movie="movie")

## ----eval=FALSE----------------------------------------------------------
#  writeWebGL(filename = "index.html")

