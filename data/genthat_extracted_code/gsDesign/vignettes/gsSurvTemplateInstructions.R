## ----packages, echo=FALSE, results="hide", message=FALSE-----------------
options(width=58)

## ----enrollment, message=FALSE-------------------------------------------
require(gsDesign)
# enrollment period durations; the last of these will be extended if T=NULL below
R <- c(1,2,3,4)
# relative enrollment rates during above periods
gamma<-c(1,1.5,2.5,4)
# study duration
# T can be set to NULL if you want to 
# fix enrollment and vary study duration
T <- 36 
# follow-up duration of last patient enrolled
minfup <- 12
# randomization ratio, experimental/control
ratio <- 1

## ----ep------------------------------------------------------------------
# median control time-to-event
median <- 12
# exponential dropout rate per unit of time
eta <- .001
# hypothesized experimental/control hazard ratio
hr <- .75
# null hazard ratio (1 for superiority, >1 for non-inferiority)
hr0 <- 1
# Type I error (1-sided)
alpha <-.025
# Type II error (1-power)
beta<-.1

## ----nsurv,tidy=FALSE----------------------------------------------------
x <- nSurv(R=R,gamma=gamma,eta=eta,minfup=minfup,
           T=T,lambdaC=log(2)/median,
           hr=hr,hr0=hr0,beta=beta,alpha=alpha)

## ----textstuff,echo=TRUE,results="hide"----------------------------------
# time units
timename <- "months"
timename1 <- "month"
# endpoint name
ep <-"overall survival" 
# make a string with enrollment rates (assumes gamma is a single value or vector)
nR <- length(x$R)
if (nR==1){enrolrates <- paste("constant at a rate of ",round(gamma,1),"per",timename1,".")
} else{
enrolrates <- paste(c("piecewise constant at rates of ",
 paste(round(as.vector(x$gamma),1)," for ",timename," ",cumsum(c(0,x$R[1:(nR-1)])),
       "-",cumsum(x$R),collapse=", "),sep=""),collapse="")
}

## ----sf------------------------------------------------------------------
# number of analyses (interim + final)
k <- 2
# timing of interim analyses (k-1 increasing numbers >0 and <1)
timing <- c(.4)
# efficacy bound spending function
sfu <- sfHSD 
# efficacy bound spending parameter specification
sfupar <- -10
# futility bound spending function
sfl <- sfHSD 
# futility bound spending parameter specification
sflpar <- 2

## ----TypeII--------------------------------------------------------------
# Type II error=1-Power
beta <- .2

## ----captext,echo=FALSE,results="hide"-----------------------------------
# footnote text for table
footnote <- paste("P\\{Cross\\} is the probability of crossing the given bound (efficacy or futility) at or before the given analysis under the assumed hazard ratio (HR). Design assumes futility bound is discretionary (non-binding), but smaller upper boundary crossing probabilities shown here assume trial stops at first boundary crossing (binding bounds).")
# caption text for table
caption <- paste("Overall survival trial design with HR=",hr,", ",100*(1-beta),"\\% power and ",100*alpha,"\\% Type 1 error.",sep="")

## ----gsdesign,tidy=FALSE-------------------------------------------------
# generate design
x <- gsSurv(k=k,timing=timing,R=R,gamma=gamma,eta=eta,
            minfup=minfup,T=T,lambdaC=log(2)/median,
            hr=hr,hr0=hr0,beta=beta,alpha=alpha,
            sfu=sfu,sfupar=sfupar,sfl=sfl,sflpar=sflpar)
# make a string with enrollment rates 
# (assumes gamma is a single value or vector)
nR <- length(x$R)
if (nR==1){enrolrates <- paste("constant at a rate of ",
                          round(gamma,1),"per",timename1,".")
} else{
enrolrates <- paste(c("piecewise constant at rates of ",
 paste(round(as.vector(x$gamma),1)," for ",timename," ",
       cumsum(c(0,x$R[1:(nR-1)])),
       "-",cumsum(x$R),collapse=", "),sep=""),collapse="")
}

## ----tab1, results="asis",echo=TRUE,message=FALSE,tidy=FALSE-------------
print(xtable(x,footnote=footnote,caption=caption,
             label="tab1"), 
      include.rownames=F, 
      sanitize.text.function=function(x) x)

## ----tab2, results="asis",tidy=FALSE,message=FALSE,tidy=FALSE------------
xprint(xtable(gsBoundSummary(x, logdelta=TRUE), 
              digits=4, label="tab2", 
              caption=summary(x)))

## ----p1, fig.height=3.5,tidy=FALSE,fig.cap="Z-value bound plot"----------
plot(x,cex=.8,xlab="Number of events")

## ----p2, fig.height=3.5,fig.cap="Hazard ratio bound plot"----------------
plot(x,plottype="hr",cex=.8,xlab="Number of events")

