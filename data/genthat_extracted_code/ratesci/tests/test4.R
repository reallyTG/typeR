library(ratesci)
context("Laud 2017 Examples")

alpha<-0.05
x1hkp = c(12,19,5)
x2hkp = c(1,22,0)
n1hkp = c(16,29,56)
n2hkp = c(16,30,29)

x1g<-5; x2g <- 0; n1g <- 56; n2g <- 29

if(FALSE){
diffBinconf.meta<-function(x1,n1,x2,n2,level=0.95,weight="MH",incr=0.5,addincr=F,MH.exact=T,hakn=F,contrast="RD",distrib="bin") {
  if(hakn==T) {random <- T; weight <- "Inverse"}
  if(distrib=="bin") {
    meta <- metabin(event.e=x1,n.e=n1,event.c=x2,n.c=n2,sm=contrast,backtransf=T,level=level,level.comb=level,method=weight,warn=T,addincr=addincr,incr=incr,MH.exact=MH.exact,hakn=hakn,allstudies=F)
  } else if(distrib=="poi") {
    meta <- metainc(event.e=x1,time.e=n1,event.c=x2,time.c=n2,sm=paste("I",contrast,sep=""),level=level,level.comb=level,method=weight,warn=T,addincr=addincr,incr=incr,hakn=hakn)
  }
  Z<-qnorm(1-(1-level)/2)
  theta<-meta$TE.fixed
  lcl<-meta$lower.fixed   #meta$TE.fixed-Z*meta$seTE.fixed
  ucl<-meta$upper.fixed   #meta$TE.fixed+Z*meta$seTE.fixed
  if (!is.na(meta$lower.random)) lcl.rand<-meta$lower.random else lcl.rand <- lcl  #meta$TE.random-Z*meta$seTE.random
  if (!is.na(meta$TE.random)) theta.rand<-meta$TE.random else theta.rand <- theta  #meta$TE.random-Z*meta$seTE.random
  if (!is.na(meta$upper.random)) ucl.rand<-meta$upper.random else ucl.rand <- ucl  #meta$TE.random+Z*meta$seTE.random
  estimates <- cbind(lcl,theta,ucl,lcl.rand,theta.rand,ucl.rand)
  if(contrast %in% c("RR","OR")) estimates <- exp(estimates)
  return(list(estimates=estimates,homog=cbind(Q=meta$Q,tau2=meta$tau^2,I2=100*meta$I2,pvalQ=1-pchisq(meta$Q,meta$df.Q))))
}
}

###################
#Table 2: Example unstratified confidence intervals using cisapride data plus one from Newcombe
###################
#fround <- function(x,digits=6) paste("(",paste(format(round(x,digits=digits),nsmall=digits),collapse=", "),")",sep="")
fround <- function(x,digits=6) t(c(round(x,digits=digits)))

#tab2 <- list()
tab2 <- NULL
for (i in 1:3) {
  x1 <- x1hkp[i]
  x2 <- x2hkp[i]
  n1 <- n1hkp[i]
  n2 <- n2hkp[i]
  mytab <-rbind(SCAS=
                  cbind(
                    RDbin=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,theta0=0.5,skew=T,contrast="RD")$estimates[,c(1,3)],3),
                    RDpoi=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,theta0=0.5,skew=T,contrast="RD",distrib="poi")$estimates[,c(1,3)],3),
                    RRbin=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,theta0=0.5,skew=T,contrast="RR")$estimates[,c(1,3)],3),
                    RRpoi=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,theta0=0.5,skew=T,contrast="RR",distrib="poi")$estimates[,c(1,3)],3),
                    OR=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,theta0=0.5,skew=T,ORbias=F,contrast="OR")$estimates[,c(1,3)],3)
#                    OR=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,theta0=0.5,skew=T,ORbias=T,contrast="OR")$estimates[,c(1,3)],3) #Corrigendum version
                  ), MN=
                  cbind(
                    RDbin=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,theta0=0.5,skew=F,contrast="RD")$estimates[,c(1,3)],3),
                    RDpoi=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,theta0=0.5,skew=F,contrast="RD",distrib="poi")$estimates[,c(1,3)],3),
                    RRbin=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,theta0=0.5,skew=F,contrast="RR")$estimates[,c(1,3)],3),
                    RRpoi=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,theta0=0.5,skew=F,contrast="RR",distrib="poi")$estimates[,c(1,3)],3),
                    OR=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,theta0=0.5,skew=F,ORbias=F,contrast="OR")$estimates[,c(1,3)],3)
                  ), MOVERJ=
                  cbind(
                    RDbin=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="bin",contrast="RD",adj=F)[,c(1,3)],3),
                    RDpoi=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="poi",contrast="RD",adj=F)[,c(1,3)],3),
                    RRbin=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="bin",contrast="RR",adj=F)[,c(1,3)],3),
                    RRpoi=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="poi",contrast="RR",adj=F)[,c(1,3)],3),
                    OR=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="bin",contrast="OR",adj=F)[,c(1,3)],3)
                  )
#                , AN=
#                  c(
#                    RDbin=fround(diffBinconf.meta(x1=x1,x2=x2,n1=n1,n2=n2,level=1-alpha,contrast="RD",incr=0)$estimates[,c(1,3)],3),
#                    RDpoi=fround(diffBinconf.meta(x1=x1,x2=x2,n1=n1,n2=n2,level=1-alpha,contrast="RD",distrib="poi")$estimates[,c(1,3)],3) ,
#                    RRbin=fround(diffBinconf.meta(x1=x1,x2=x2,n1=n1,n2=n2,level=1-alpha,contrast="RR",incr=0)$estimates[,c(1,3)],3),
#                    RRpoi=fround(diffBinconf.meta(x1=x1,x2=x2,n1=n1,n2=n2,level=1-alpha,contrast="RR",distrib="poi")$estimates[,c(1,3)],3),
#                    OR=fround(diffBinconf.meta(x1=x1,x2=x2,n1=n1,n2=n2,level=1-alpha,contrast="OR",incr=0)$estimates[,c(1,3)],3)
#                  )
  )
  mytab
#  tab2<-list(tab2,xtable(mytab))
  tab2<-rbind(tab2,mytab)
}
tab2
#tab2check <- tab2
#save(tab2check,file="tests/testthat/Table2.Rdata")
#load(file="tests/testthat/Table2.Rdata")
load(file="Table2.Rdata")
#tab2==tab2check
test_that("no change to published examples", {
  expect_equal(
    tab2,tab2check
  )
})



###################
#Table 3: Stratified confidence intervals using cisapride data
###################
fround <- function(x,digits=6) paste0(format(round(x[1],digits=digits),nsmall=digits),ifelse(length(x)==1,"",paste0(" (",paste(format(round(x[2:length(x)],digits=digits),nsmall=digits),collapse=", "),")")))

x1hk <- c(15,12,29,42,14,44,14,29,10,17,38,19,21)
x2hk <- c(9,1,18,31,6,17,7,23,3,6,12,22,19)
n1hk <- c(16,16,34,56,22,54,17,58,14,26,44,29,38)
n2hk <- c(16,16,34,56,22,55,15,58,15,27,45,30,38)

tab3 <-rbind(
  SCASmh=c(
    RDbin=fround(scoreci(x1=x1hk,x2=x2hk,n1=n1hk,n2=n2hk,contrast="RD",stratified=T,weighting="MH",skew=T,random=F,hk=T,fixtau=T)$estimates[,c(2,1,3)],3),
    RRbin=fround(scoreci(x1=x1hk,x2=x2hk,n1=n1hk,n2=n2hk,contrast="RR",stratified=T,weighting="MH",skew=T,random=F,hk=T,fixtau=T)$estimates[,c(2,1,3)],2),
    OR=fround(scoreci(x1=x1hk,x2=x2hk,n1=n1hk,n2=n2hk,contrast="OR",stratified=T,weighting="MH",skew=T,ORbias=F,random=F,hk=F,fixtau=T)$estimates[,c(2,1,3)],2)
  ),
  SCASiv=c(
    RDbin=fround(scoreci(x1=x1hk,x2=x2hk,n1=n1hk,n2=n2hk,contrast="RD",stratified=T,weighting="IVS",skew=T,random=F,hk=T,fixtau=T)$estimates[,c(2,1,3)],3),
    RRbin=fround(scoreci(x1=x1hk,x2=x2hk,n1=n1hk,n2=n2hk,contrast="RR",stratified=T,weighting="IVS",skew=T,random=F,hk=T,fixtau=T)$estimates[,c(2,1,3)],2),
    OR=fround(scoreci(x1=x1hk,x2=x2hk,n1=n1hk,n2=n2hk,contrast="OR",stratified=T,weighting="IVS",skew=T,ORbias=F,random=F,hk=F,fixtau=T)$estimates[,c(2,1,3)],2)
  ),
  TDAS=c(
    RDbin=fround(scoreci(x1=x1hk,x2=x2hk,n1=n1hk,n2=n2hk,contrast="RD",stratified=T,weighting="IVS",skew=F,tdas=T)$estimates[,c(2,1,3)],3),
    RRbin=fround(scoreci(x1=x1hk,x2=x2hk,n1=n1hk,n2=n2hk,contrast="RR",stratified=T,weighting="IVS",skew=F,tdas=T)$estimates[,c(2,1,3)],2),
    OR=fround(scoreci(x1=x1hk,x2=x2hk,n1=n1hk,n2=n2hk,contrast="OR",stratified=T,weighting="IVS",skew=F,tdas=T)$estimates[,c(2,1,3)],2)
  )
)
tab3
#tab3check <- tab3
#save(tab3check,file="tests/testthat/Table3.Rdata")
load(file="Table3.Rdata")
#tab2==tab2check
test_that("no change to published examples", {
  expect_equal(
    tab3,tab3check
  )
})


#Examples below need converting into test_that calls

if(FALSE) {



###################
#Table S1: Example continuity-corrected & 'compromise' confidence intervals
#using cisapride data plus one from Newcombe
###################
fround <- function(x,digits=6) paste("(",paste(format(round(x,digits=digits),nsmall=digits),collapse=", "),")",sep="")

tabS1 <- list()
for (i in 1:3) {
  x1 <- x1hkp[i]
  x2 <- x2hkp[i]
  n1 <- n1hkp[i]
  n2 <- n2hkp[i]

  alpha <- 0.05
  mytab <-rbind(SCAScc0.5=
    c(
      RDbin=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,skew=T,contrast="RD",cc=0.5)$estimates[,c(1,3)],3),
      RDpoi=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,skew=T,contrast="RD",distrib="poi",cc=0.5)$estimates[,c(1,3)],3),
      RRbin=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,skew=T,contrast="RR",cc=0.5)$estimates[,c(1,3)],3),
      RRpoi=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,skew=T,contrast="RR",distrib="poi",cc=0.5)$estimates[,c(1,3)],3),
      OR=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,skew=T,contrast="OR",cc=0.5)$estimates[,c(1,3)],3)
    ), SCAScc0.25=
      c(
        RDbin=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,skew=T,contrast="RD",cc=0.25)$estimates[,c(1,3)],3),
        RDpoi=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,skew=T,contrast="RD",distrib="poi",cc=0.25)$estimates[,c(1,3)],3),
        RRbin=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,skew=T,contrast="RR",cc=0.25)$estimates[,c(1,3)],3),
        RRpoi=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,skew=T,contrast="RR",distrib="poi",cc=0.25)$estimates[,c(1,3)],3),
        OR=fround(scoreci(x1=x1,x2=x2,n1=n1,n2=n2,stratified=F,skew=T,contrast="OR",cc=0.25)$estimates[,c(1,3)],3)
      ), MOVERcc0.5=
      c(
        RDbin=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="bin",contrast="RD",cc=0.5)[,c(1,3)],3),
        RDpoi=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="poi",contrast="RD",cc=0.5)[,c(1,3)],3),
        RRbin=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="bin",contrast="RR",cc=0.5)[,c(1,3)],3),
        RRpoi=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="poi",contrast="RR",cc=0.5)[,c(1,3)],3),
        OR=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="bin",contrast="OR",cc=0.5)[,c(1,3)],3)
    ), MOVERcc0.25=
    c(
      RDbin=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="bin",contrast="RD",cc=0.25)[,c(1,3)],3),
      RDpoi=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="poi",contrast="RD",cc=0.25)[,c(1,3)],3),
      RRbin=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="bin",contrast="RR",cc=0.25)[,c(1,3)],3),
      RRpoi=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="poi",contrast="RR",cc=0.25)[,c(1,3)],3),
      OR=fround(moverci(x1=x1,x2=x2,n1=n1,n2=n2,distrib="bin",contrast="OR",cc=0.25)[,c(1,3)],3)
    )
  )
  tabS1<-list(tabS1,xtable(mytab))
}
tabS1

###################
#Table S2: Single proportion using Newcombe example
###################
fround <- function(x,digits=6) paste("(",paste(format(round(x,digits=digits),nsmall=digits),collapse=", "),")",sep="")

waldci <- function(x,n,distrib="bin",level=0.95) {
  phat <- x/n
  z <- qnorm(1 - (1-level)/2)
  if(distrib == "bin") waldci <- cbind(x/n + z * t(c(-1,1)) * sqrt(phat * (1 - phat)/n))
  if(distrib == "poi") waldci <- cbind(x/n + z * t(c(-1,1)) * sqrt(phat/n))
  return(waldci)
}

tabS2 <-rbind(SCAS=
                c(
                  pbin1=fround(scoreci(x1=x1g,n1=n1g,contrast="p")$estimates[,c(1,3)],3),
                  ppoi1=fround(scoreci(x1=x1g,n1=n1g,contrast="p",distrib="poi")$estimates[,c(1,3)],3),
                  pbin2=fround(scoreci(x1=x2g,n1=n2g,contrast="p")$estimates[,c(1,3)],3),
                  ppoi2=fround(scoreci(x1=x2g,n1=n2g,contrast="p",distrib="poi")$estimates[,c(1,3)],3)
                ),
              Jeffreys=
                c(
                  pbin1=fround(jeffreysci(x=x1g,n=n1g,adj=F)[,c(1,2)],3),
                  ppoi1=fround(jeffreysci(x=x1g,n=n1g,adj=F,distrib="poi")[,c(1,2)],3),
                  pbin2=fround(jeffreysci(x=x2g,n=n2g,adj=F)[,c(1,2)],3),
                  ppoi2=fround(jeffreysci(x=x2g,n=n2g,adj=F,distrib="poi")[,c(1,2)],3)
                ),
              Score=
                c(
                  pbin1=fround(scoreci(x1=x1g,n1=n1g,contrast="p",skew=F)$estimates[,c(1,3)],3),
                  ppoi1=fround(scoreci(x1=x1g,n1=n1g,contrast="p",skew=F,distrib="poi")$estimates[,c(1,3)],3),
                  pbin2=fround(scoreci(x1=x2g,n1=n2g,contrast="p",skew=F)$estimates[,c(1,3)],3),
                  ppoi2=fround(scoreci(x1=x2g,n1=n2g,contrast="p",skew=F,distrib="poi")$estimates[,c(1,3)],3)
                ),
              Wald=
                c(
                  pbin1=fround(waldci(x=x1g,n=n1g)[,c(1,2)],3),
                  ppoi1=fround(waldci(x=x1g,n=n1g,distrib="poi")[,c(1,2)],3),
                  pbin2=fround(waldci(x=x2g,n=n2g)[,c(1,2)],3),
                  ppoi2=fround(waldci(x=x2g,n=n2g,distrib="poi")[,c(1,2)],3)
                )
)
tabS2
xtable(tabS2)



}
