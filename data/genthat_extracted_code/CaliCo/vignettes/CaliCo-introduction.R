## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  echo=TRUE, cache=FALSE)
if (Sys.info()[['sysname']]=="Windows")
{
    windowsFonts(Times=windowsFont("TT Times New Roman"))
}

## ---- fig.width=5,fig.height=4,echo=FALSE,fig.align='center'-------------
library(ggplot2)
n=10
X <- seq(0,1,length.out=n)
code <- function(X,theta)
{
  return((6*X-2)^2*sin(theta*X-4))
}
Yexp <- code(X,10.5)+rnorm(n,0,sqrt(0.01))
Yt <- code(X,11)
gdata <- data.frame(y=Yexp,x=X,type="Experiments")
gdata2 <- data.frame(y=Yt,x=X,type="Theoretical results")
gdata <- rbind(gdata,gdata2)

p1 <- ggplot(gdata,aes(x = x,y=y, col=type))+geom_line() + theme_light() + theme(legend.title = element_blank(),
                                  legend.position = c(0.5,0.8),
                                  legend.background = element_rect(linetype="solid", colour ="grey"),
                                  axis.title=element_text(size=20,family = "Helvetica",face = "italic"),
                                  axis.text = element_text(size=20),
                                  legend.text = element_text(size=10))
p1

## ---- fig.width=5,fig.height=4,echo=FALSE,fig.align='center'-------------
theta.prior <- rnorm(100,11,sqrt(.5))
sigma.prior <- 0.01

Y_prior <- matrix(nr=100,nc=n)
for (i in 1:100){
  Y_prior[i,] <- code(X,theta.prior[i])+rnorm(n,0,sqrt(sigma.prior))
}

qq <- apply(Y_prior,2,quantile,probs=c(0.05,0.95))
gdata <- data.frame(y=Yexp,x=X,upper=qq[2,],lower=qq[1,],type="Experiments",fill="credibility interval a priori at 90%")
gdata2 <- data.frame(y=Yt,x=X,upper=qq[2,],lower=qq[1,],type="Prior belief",fill="credibility interval a priori at 90%")
gdata <- rbind(gdata,gdata2)

p2 <- ggplot(gdata)+geom_line(aes(x=x,y=y,col=type))+geom_ribbon(aes(x=x,ymax=upper,ymin=lower,fill=fill),alpha=0.3)+theme_light()+theme(legend.title = element_blank(),
                                  legend.position = c(0.3,0.8),
                                  legend.background = element_rect(linetype="solid", colour ="grey"),
                                  axis.title=element_text(size=20,family = "Helvetica",face = "italic"),
                                  axis.text = element_text(size=20),
                                  legend.text = element_text(size=10))
p2

## ---- echo=TRUE----------------------------------------------------------
library(CaliCo)
# Number of experiments
n=10
# Time interval
t <- seq(0,1,length.out=n)
# Code definition
code <- function(t,theta)
{
  return((6*t-2)^2*sin(theta*t-4))
}
# Generate the experiment
Yexp <- code(t,10.5)+rnorm(n,0,sqrt(0.01))
# Generate the first model
model1 <- model(code=code,X=t,Yexp=Yexp,model="model1")

## ----echo=TRUE-----------------------------------------------------------
print(model1)

## ---- echo=TRUE----------------------------------------------------------
model1 %<% list(theta=11,var=0.01)

## ---- echo=TRUE,eval=TRUE,fig.width=5,fig.height=4,fig.align="center"----
plot(model1,t)

## ---- echo=TRUE,fig.width=5,fig.height=4,fig.align="center"--------------
library(ggplot2)
p <- plot(model1,t)
p+ggtitle("Model1 and experiments")+ylab("y")+xlab("t")+
  theme(legend.position=c(0.3,0.75),legend.text=element_text(size = '7'))

## ---- echo=TRUE----------------------------------------------------------
model2code <- model(code,X,Yexp,"model2",
                    opt.gp=list(type="matern5_2", DOE=NULL),
                    opt.emul=list(p=1,n.emul=40,binf=8,bsup=13))

## ---- echo=FALSE---------------------------------------------------------
myDOE <- DiceDesign::lhsDesign(30,2)$design
myDOE[,2] <- unscale(myDOE[,2],8,13)

## ---- echo=TRUE----------------------------------------------------------
model2doe <- model(code,X,Yexp,"model2",
                   opt.gp=list(type="matern5_2", DOE=myDOE))

## ---- echo=FALSE---------------------------------------------------------
Ys <- matrix(nr=30,nc=1)
for (i in 1:30)
{
  Ys[i] <- code(myDOE[i,1],myDOE[i,2])
}

## ---- echo=TRUE----------------------------------------------------------
model2 <- model(code=NULL,X,Yexp,"model2",
                opt.gp=list(type="matern5_2", DOE=NULL),
                opt.sim=list(Ysim=Ys,DOEsim=myDOE))

## ---- echo=TRUE, results='hide'------------------------------------------
paramList <- list(theta=11,var=0.1)
model2code %<% paramList
model2doe %<% paramList
model2 %<% paramList

## ---- echo=TRUE, eval=TRUE,fig.width=5,fig.height=4,fig.align="center"----
plot(model2code,t)
plot(model2doe,t)
plot(model2,t)

## ---- echo=TRUE----------------------------------------------------------
model3 <- model(code,X,Yexp,"model3",
                opt.disc=list(kernel.type="matern5_2"))

## ---- echo=TRUE----------------------------------------------------------
model4 <- model(code,X,Yexp,"model4",
                opt.gp=list(type="matern5_2", DOE=NULL),
                opt.sim=list(Ysim=Ys,DOEsim=myDOE),
                opt.disc=list(kernel.type="gauss"))

## ---- echo=TRUE----------------------------------------------------------
model3 %<% list(theta=11,thetaD=c(0.1,0.5),var=0.1)
model4 %<% list(theta=11,thetaD=c(0.1,0.5),var=0.1)

## ---- echo=TRUE, eval=TRUE, fig.width=5,fig.height=4, fig.align="center"----
plot(model3,t)
plot(model4,t)

## ---- fig.width=4,fig.align='center'-------------------------------------
gaussian <- prior(type.prior="gaussian",opt.prior=list(c(0.5,0.001)))
plot(gaussian)

## ---- fig.width=4,fig.align='center'-------------------------------------
pr1 <- prior(type.prior=c("gaussian","gamma"),
             opt.prior=list(c(11,0.01),c(1,0.1)))
plot(pr1$Prior1)
plot(pr1$Prior2)

## ---- fig.width=4,fig.align='center'-------------------------------------
pr2 <- prior(type.prior=c("gaussian","gamma","unif","gamma"),
             opt.prior=list(c(11,0.01),c(1,2),c(0,1),c(1,0.1)))
plot(pr2$Prior2)
plot(pr2$Prior3)

## ---- echo=TRUE, results="hide"------------------------------------------
mdfit1 <- calibrate(model1,pr1,
                    opt.estim = list(Ngibbs=200,Nmh=400,thetaInit=c(11,0.01),
                                     r=c(0.3,0.3),sig=diag(2),Nchains=1,burnIn=100))

## ----echo=TRUE-----------------------------------------------------------
print(mdfit1)

## ---- echo=TRUE,fig.width=7,fig.height=5,fig.align='center'--------------
plot(mdfit1,t)

## ---- echo=TRUE----------------------------------------------------------
mcmc <- chain(mdfit1)
head(mcmc)

## ---- echo=TRUE----------------------------------------------------------
Estimators <- estimators(mdfit1)
print(Estimators)

## ---- echo=TRUE, eval=FALSE, results="hide"------------------------------
#  mdfit4 <- calibrate(model4,pr2,
#                      opt.estim = list(Ngibbs=1000,Nmh=3000,thetaInit=c(11,2,0.5,0.01),
#                                        r=c(0.3,0.3),sig=diag(4),Nchains=1,burnIn=1000))

## ---- echo=TRUE----------------------------------------------------------
x.new <- seq(1,1.5,length.out=10)
fr <- forecast(mdfit1,x.new)

## ---- echo=TRUE, eval=TRUE,fig.width=5,fig.height=4,fig.align='center'----
plot(fr,c(t,x.new))

