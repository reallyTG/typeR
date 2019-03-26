### R code from vignette source 'oglmxVignette.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: oglmxVignette.Rnw:147-148
###################################################
  x_1param<-0.75


###################################################
### code chunk number 2: oglmxVignette.Rnw:161-184
###################################################
  set.seed(242)
  n<-250
  x1<-rbinom(n,1,0.75) # binary variable
  x2<-rnorm(n) # continuous variable
  sampledata<-cbind(rep(1,n),x1,x2)
  # set true parameter values
  meanparams<-c(0.5,1,-0.5) 
  varparams<- c(0,0.5,-0.5)
  # generate latent variable
  ystar<-sampledata%*%meanparams+rnorm(n)*exp(sampledata%*%varparams)
  # generate outcome variable
  threshparams<-c(-0.5,0.5,1.5)
  outcomes<-c(-1,0,1,2)
  setvalue<-function(x){
    locate<-outcomes[1:(length(outcomes)-1)][x<threshparams]
    if (length(locate)==0){
      return(outcomes[length(outcomes)])
    } else {
      return(locate[1])
    }
  }
  y<-sapply(ystar,setvalue)
  sampleframe<-data.frame(y,x1,x2)


###################################################
### code chunk number 3: oglmxVignette.Rnw:189-214
###################################################
  # calculate marginal effects at means. 
  # output is two vectors (one for each variable) of length equal to number of outcomes (four)
  xB<-c(1,x_1param,0)%*%meanparams
  zD<-c(1,x_1param,0)%*%varparams
  exp_zD<- exp(zD)
  invexp_zD<-1/exp_zD
  threshparams<-c(-Inf,threshparams,Inf)
  x1Meffs<-x2Meffs<-vector("numeric",length(outcomes))
  for (i in 1:length(outcomes)){
    if (i==1){
      ratio1<-(threshparams[i+1]-xB)*invexp_zD
      x1Meffs[i]<- -meanparams[2]*invexp_zD*dnorm(ratio1)-varparams[2]*ratio1*dnorm(ratio1)
      x2Meffs[i]<- -meanparams[3]*invexp_zD*dnorm(ratio1)-varparams[3]*ratio1*dnorm(ratio1)
    } else if (i==length(outcomes)){
      ratio0<-(threshparams[i]-xB)*invexp_zD
      x1Meffs[i]<- -meanparams[2]*invexp_zD*(-dnorm(ratio0))-varparams[2]*(-ratio0*dnorm(ratio0))
      x2Meffs[i]<- -meanparams[3]*invexp_zD*(-dnorm(ratio0))-varparams[3]*(-ratio0*dnorm(ratio0))
    } else {
    ratio1<-(threshparams[i+1]-xB)*invexp_zD
    ratio0<-(threshparams[i]-xB)*invexp_zD
    x1Meffs[i]<- -meanparams[2]*invexp_zD*(dnorm(ratio1)-dnorm(ratio0))-varparams[2]*(ratio1*dnorm(ratio1)-ratio0*dnorm(ratio0))
    x2Meffs[i]<- -meanparams[3]*invexp_zD*(dnorm(ratio1)-dnorm(ratio0))-varparams[3]*(ratio1*dnorm(ratio1)-ratio0*dnorm(ratio0))
    }
  }
  write.csv(data.frame(x1Meffs,x2Meffs),"calculatedMargEffs.csv",row.names = FALSE)


###################################################
### code chunk number 4: oglmxVignette.Rnw:237-245
###################################################
  library("oglmx")
  results.oprob<-oglmx(y ~ x1 + x2, data=sampleframe, link="probit",
                       constantMEAN = FALSE, constantSD = FALSE, 
                       delta=0,threshparam = NULL)
  results.oprob1<-oprobit.reg(y ~ x1 + x2, data=sampleframe)
  summary(results.oprob)
  summary(results.oprob1)
  margins.oglmx(results.oprob,ascontinuous = TRUE)


###################################################
### code chunk number 5: oglmxVignette.Rnw:250-259
###################################################
  results.oprobhet<-oglmx(y ~ x1 + x2, ~ x1 + x2, data=sampleframe,
                          constantMEAN = FALSE, constantSD = FALSE)
  results.oprobhet1<-oglmx(y ~ x1 + x2, ~ x1 + x2, data=sampleframe,
                          constantMEAN = TRUE, constantSD = TRUE,
                          threshparam=c(-0.5,NA,1.5))
  summary(results.oprobhet)
  summary(results.oprobhet1)
  margins.oglmx(results.oprobhet)
  margins.oglmx(results.oprobhet1)


###################################################
### code chunk number 6: oglmxVignette.Rnw:266-268
###################################################
  library("lmtest")
  lrtest(results.oprob,results.oprobhet)


