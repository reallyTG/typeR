## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("automultinomial")
#  library(automultinomial)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("devtools")

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github(repo="stephenberg/automultinomial")
#  library(automultinomial)

## ------------------------------------------------------------------------
library(automultinomial)
set.seed(33)

#10 predictors
p=5


#n times n grid
n=40

#make grid and adjacency matrix
latticeGraph=igraph::make_lattice(c(n,n))
A=igraph::get.adjacency(latticeGraph)

#set coefficient values 
beta=matrix(rnorm(p),ncol=1)*0.3
beta

#set covariate values
X=matrix(rnorm(n^2*p),ncol=p)

#set the correlation parameter value (0.7 is a moderate amount of spatial correlation)
gamma=0.7

## ----echo=FALSE----------------------------------------------------------
load("data/2category.RData")
y=as.numeric(y)
y2=as.numeric(y2)

## ----eval=FALSE----------------------------------------------------------
#  #use drawSamples to simulate data with parameters beta and gamma by Gibbs sampling
#  y=drawSamples(beta,gamma,X,A,nSamples = 1)

## ----eval=FALSE----------------------------------------------------------
#  y2=drawSamples(beta,0,X,A,nSamples = 1)

## ----eval=FALSE----------------------------------------------------------
#  # responses must be input as a factor
#  y=factor(y)
#  fit1=MPLE(X=X,y=y,A=A,ciLevel = 0.95,method = "asymptotic")
#  fit2=MPLE(X=X,y=y,A=A,ciLevel = 0.95,method = "boot",nBoot = 500)

## ------------------------------------------------------------------------
#to see the information contained in fit1 and fit2, use str() (not run to save space)
#str(fit1)
#str(fit2)

fitSummary1=MPLE_summary(fit1)
fitSummary2=MPLE_summary(fit2)


## ----echo=FALSE,warning=FALSE--------------------------------------------
library(ggplot2)
ciMat1=fit1$ciMatrix
ciMat2=fit1$ciMatrix
df=cbind(fit1$ciMatrix,fit2$ciMatrix,c(beta,gamma),c(fit1$betaHat,fit1$gammaHat))
df=as.data.frame(df)
df=cbind(df,factor(c(as.character(1:5),"gamma")))
colnames(df)[5:7]=c("Truth","MPLE","coefficient")
colnames(df)[1:4]=as.character(1:4)
cbPalette <- c("Asymptotic"="#009E73" ,"Bootstrap"="#CC79A7","MPLE"="#009E73" ,"Truth"="#CC79A7")
cbPalette2 <- c("MPLE"=21 ,"Truth"=23)
p1=ggplot()+geom_errorbar(data=df,aes(x=coefficient,ymin=df[,1],ymax=df[,2],color="Asymptotic"),size=1)+geom_errorbar(data=df,aes(x=coefficient,ymin=df[,3],ymax=df[,4],color="Bootstrap"),size=1)
p1=p1+geom_point(show.legend=TRUE)
p1=p1+geom_point(data=df,aes(x=coefficient,y=MPLE,shape="MPLE"))
p1=p1+geom_point(data=df,aes(x=coefficient,y=Truth,shape="Truth"))
p1=p1+scale_y_continuous(limits=c(-1.0,1.0),name = "Coefficient Estimates")
p1=p1+scale_colour_manual(name="95% CI",values=cbPalette)
p1=p1+scale_shape_manual(name="Type",values=cbPalette2)
p1

## ------------------------------------------------------------------------
set.seed(42)

#10 predictors
p=5

#n times n grid
n=40

#make grid and adjacency matrix
latticeGraph=igraph::make_lattice(c(n,n))
A=igraph::get.adjacency(latticeGraph)

#set coefficient values 
#with 3 categories in the response, beta is now a matrix
beta=matrix(rnorm(p*2),ncol=2)*0.3
beta

#set covariate values
X=matrix(rnorm(n^2*p),ncol=p)

#set the correlation parameter value (0.7 is a moderate amount of spatial correlation)
gamma=0.7

## ----echo=FALSE----------------------------------------------------------
load("data/3category.RData")
y=as.numeric(y)
y2=as.numeric(y2)

## ----eval=FALSE----------------------------------------------------------
#  #use drawSamples to simulate data with parameters beta and gamma by Gibbs sampling
#  y=drawSamples(beta,gamma,X,A,nSamples = 1)

## ----eval=FALSE----------------------------------------------------------
#  y2=drawSamples(beta,0,X,A,nSamples = 1)

## ----eval=FALSE----------------------------------------------------------
#  #responses must be input as a factor
#  y=factor(y)
#  fit1=MPLE(X=X,y=y,A=A,ciLevel = 0.95,method = "asymptotic")
#  fit2=MPLE(X=X,y=y,A=A,ciLevel = 0.95,method = "boot",nBoot = 500)

## ------------------------------------------------------------------------
#to see the information contained in fit1 and fit2, use str() (not run to save space)
#str(fit1)
#str(fit2)

fitSummary1=MPLE_summary(fit1)
fitSummary2=MPLE_summary(fit2)


## ----echo=FALSE,warning=FALSE--------------------------------------------
library(ggplot2)
ciMat1=fit1$ciMatrix
ciMat2=fit1$ciMatrix
df=cbind(fit1$ciMatrix,fit2$ciMatrix,c(beta,gamma),c(fit1$betaHat,fit1$gammaHat))
df=as.data.frame(df)
df=cbind(df,factor(rownames(ciMat1)))
colnames(df)[5:7]=c("Truth","MPLE","coefficient")
colnames(df)[1:4]=as.character(1:4)
cbPalette <- c("Asymptotic"="#009E73" ,"Bootstrap"="#CC79A7","MPLE"="#009E73" ,"Truth"="#CC79A7")
cbPalette2 <- c("MPLE"=21 ,"Truth"=23)
p1=ggplot()+geom_errorbar(data=df,aes(x=coefficient,ymin=df[,1],ymax=df[,2],color="Asymptotic"),size=1)+geom_errorbar(data=df,aes(x=coefficient,ymin=df[,3],ymax=df[,4],color="Bootstrap"),size=1)
p1=p1+geom_point(show.legend=TRUE)
p1=p1+geom_point(data=df,aes(x=coefficient,y=MPLE,shape="MPLE"))
p1=p1+geom_point(data=df,aes(x=coefficient,y=Truth,shape="Truth"))
p1=p1+scale_y_continuous(limits=c(-0.5,0.9),name = "Coefficient Estimates")
p1=p1+scale_colour_manual(name="95% CI",values=cbPalette)
p1=p1+scale_shape_manual(name="Type",values=cbPalette2)
p1

## ------------------------------------------------------------------------
#making a square lattice graph and adjacency matrix with toroidal boundary conditions
#every site has 4 neighbors
t1=igraph::make_lattice(c(40,40),circular=TRUE)
a1=igraph::get.adjacency(t1)


#making a square lattice graph and adjacency matrix with free boundary conditions
#sites have 2 neighbors at the corner of the lattice, 3 neighbors on edges of the lattice,
#and 4 neighbors internal to the lattice
t2=igraph::make_lattice(c(40,40),circular=FALSE)
a2=igraph::get.adjacency(t2)

#making the X matrices: X does not have an intercept, but X_intercept has an intercept
X=matrix(rnorm(1600*2),ncol=2)
X_intercept=cbind(rep(1,1600),X)

beta=rnorm(3)
gamma=0.5

## ----eval=FALSE----------------------------------------------------------
#  #simulated responses
#  y=drawSamples(beta=beta,gamma=gamma,X = X_intercept, A=a1,nSamples = 1)

## ----echo=FALSE----------------------------------------------------------
load("data/paramExample.RData")

## ------------------------------------------------------------------------
fitAsymmetric=glm(factor(y)~cbind(X,as.matrix(a1%*%(y-1))),family=binomial())
fitAutomultinomial=MPLE(X=X_intercept,y=factor(y),A = a1,method="asymptotic")

#comparing pseudolikelihoods: identical
fitAsymmetric$deviance/-2
fitAutomultinomial$pseudolikelihood

#comparing beta: identical
fitAsymmetric$coefficients[2:3]
fitAutomultinomial$betaHat[2:3]

#comparing intercept and gamma: not identical, but there is a mapping between them
gammaAsymmetric=fitAsymmetric$coefficients[4]
gammaAutomultinomial=fitAutomultinomial$gammaHat
gammaAsymmetric
gammaAutomultinomial*2

interceptAutomultinomial=fitAutomultinomial$betaHat[1]
interceptAsymmetric=fitAsymmetric$coefficients[1]
interceptAsymmetric
interceptAutomultinomial-4*gammaAutomultinomial

## ------------------------------------------------------------------------
fitAsymmetric1=glm(factor(y)~cbind(X,as.matrix(a2%*%(y-1))),family=binomial())
fitAutomultinomial1=MPLE(X=X_intercept,y=factor(y),A = a2,method="asymptotic")

#refitting with different reference category
y2=as.factor(y)
y2=as.numeric(relevel(y2,ref = "2"))
fitAsymmetric2=glm(factor(y2)~cbind(X,as.matrix(a2%*%(y2-1))),family=binomial())
fitAutomultinomial2=MPLE(X=X_intercept,y=factor(y2),A = a2,method="asymptotic")


#comparing pseudolikelihoods: not identical
fitAsymmetric1$deviance/-2 
fitAsymmetric2$deviance/-2
fitAutomultinomial1$pseudolikelihood
fitAutomultinomial2$pseudolikelihood

#comparing beta: not identical
fitAsymmetric1$coefficients[2:3]
fitAsymmetric2$coefficients[2:3]
fitAutomultinomial1$betaHat[2:3]
fitAutomultinomial2$betaHat[2:3]

#comparing gamma: not identical. Asymmetric parameterization not invariant to
#choice of reference category. Automultinomial parameterization invariant to 
#choice of reference category
gammaAsymmetric1=fitAsymmetric1$coefficients[4]
gammaAsymmetric2=fitAsymmetric2$coefficients[4]
gammaAutomultinomial1=fitAutomultinomial1$gammaHat
gammaAutomultinomial2=fitAutomultinomial2$gammaHat
gammaAsymmetric1
gammaAsymmetric2
gammaAutomultinomial1
gammaAutomultinomial2

## ------------------------------------------------------------------------
fitAsymmetric1=glm(factor(y)~cbind(X,as.matrix(a2%*%(y-1)))-1,family=binomial())
fitAutomultinomial1=MPLE(X=X,y=factor(y),A = a2,method="asymptotic")

#refitting with different reference category
y2=as.factor(y)
y2=as.numeric(relevel(y2,ref = "2"))
fitAsymmetric2=glm(factor(y2)~cbind(X,as.matrix(a2%*%(y2-1)))-1,family=binomial())
fitAutomultinomial2=MPLE(X=X,y=factor(y2),A = a2,method="asymptotic")


#comparing pseudolikelihoods: not identical
fitAsymmetric1$deviance/-2 
fitAsymmetric2$deviance/-2
fitAutomultinomial1$pseudolikelihood
fitAutomultinomial2$pseudolikelihood

#comparing beta: not identical
fitAsymmetric1$coefficients[1:2]
fitAsymmetric2$coefficients[1:2]
fitAutomultinomial1$betaHat[1:2]
fitAutomultinomial2$betaHat[1:2]

#comparing gamma: not identical. Asymmetric parameterization not invariant to
#choice of reference category. Automultinomial parameterization invariant to 
#choice of reference category
gammaAsymmetric1=fitAsymmetric1$coefficients[3]
gammaAsymmetric2=fitAsymmetric2$coefficients[3]
gammaAutomultinomial1=fitAutomultinomial1$gammaHat
gammaAutomultinomial2=fitAutomultinomial2$gammaHat
gammaAsymmetric1
gammaAsymmetric2
gammaAutomultinomial1
gammaAutomultinomial2

