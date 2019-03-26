
# {{{ load packages
library(survival)
library(prodlim)
library(riskRegression)
library(wally)
# }}}

# {{{ To save the plots
## savePlot <- FALSE
## whereToSave <- "~/research/wallyplot-calibration/"
## if(savePlot){
    ## setwd(whereToSave)
## }
# }}}

# {{{ load data
data(threecity)
head(threecity)
## ?threecity

data(divat)
head(divat)
## ?divat
# }}}


# {{{ Fig 1 of the paper :  Calibration plos for the divat data
# Fig 1.a.
CalibFig1a <- wallyPlot(divat$pi,
                        time=5,
                        hanging=FALSE,
                        superuser.hide=FALSE,
                        superuser.choice=1,
                        superuser.zoom=TRUE,
                        formula=Hist(time,status)~1,
                        data=divat,
                        ylim=c(-.1,.60),
                        seed= 123459, 
                        hline.lwd=3,
                        mar=c(1.01, 4.1, 1.15, 2))
# Fig 1.b.
CalibFig1b <- wallyPlot(divat$pi,
                        time=5,
                        hanging=TRUE,
                        superuser.hide=FALSE,
                        superuser.choice=1,
                        superuser.zoom=TRUE,
                        formula=Hist(time,status)~1,
                        data=divat,
                        ylim=c(-.1,.60),
                        seed= 123459, 
                        hline.lwd=3,
                        mar=c(1.01, 4.1, 1.15, 2))
# }}}

# {{{ Fig 2 of the paper : Wally plot for the Three-City data 
## if(savePlot){
    ## pdf("Fig-paper-2.pdf",width=7.5,height=5)
## }
WallyFig2 <- wallyPlot(threecity$pi,
                       time=5,
                       hanging=TRUE,
                       superuser.hide=FALSE,
                       superuser.choice=NULL,
                       formula=Hist(time,status)~1,
                       data=threecity,
                       ylim=c(-.1,.25),
                       ## seed= 201705, 
                       seed= 511, 
                       hline.lwd=3,
                       mar=c(1.01, 4.1, 1.15, 2))
## if(savePlot){
    ## dev.off()
## }
# Show actual data
WallyFig2 <- wallyPlot(threecity$pi,
                       time=5,
                       hanging=TRUE,
                       superuser.hide=FALSE,
                       superuser.choice=2,
                       formula=Hist(time,status)~1,
                       data=threecity,
                       ylim=c(-.1,.25),
                       ## seed= 201705, 
                       seed= 511, 
                       hline.lwd=3,
                       mar=c(1.01, 4.1, 1.15, 2))
# }}}

# {{{ Fig 3 of the paper : Wally plot for the divat data 
## if(savePlot){
    ## pdf("Fig-paper-3.pdf",width=7.5,height=5)
## }
WallyFig3 <- wallyPlot(divat$pi,
                       time=5,
                       hanging=TRUE,
                       superuser.hide=FALSE,
                       superuser.choice=NULL,
                       formula=Hist(time,status)~1,
                       data=divat,
                       ylim=c(-.1,.60),
                       seed= 123459, 
                       hline.lwd=3,
                       mar=c(1.01, 4.1, 1.15, 2))
## if(savePlot){
    ## dev.off()
## }
# Show actual data
WallyFig3 <- wallyPlot(divat$pi,
                       time=5,
                       hanging=TRUE,
                       superuser.hide=FALSE,
                       superuser.choice=3,
                       formula=Hist(time,status)~1,
                       data=divat,
                       ylim=c(-.1,.60),
                       seed= 123459, 
                       hline.lwd=3,
                       mar=c(1.01, 4.1, 1.15, 2))
# }}}

# {{{ Fig 4 of the paper : Wally plot for  simulated data (biased predictions)

# {{{ simulate data
#Generate new data under the calibration assumption
# (that resemble the Three-City sample)
ForWallyFig4 <- wallyPlot(threecity$pi,
                       time=5,
                       hanging=TRUE,
                       superuser.hide=FALSE,
                       superuser.choice=NULL,
                       formula=Hist(time,status)~1,
                       data=threecity,
                       ylim=c(-.10,.6),
                       seed= 26345,
                       mar=c(1.1, 4.1, 1.15, 2))
# }}}

# {{{ Create biased predictions
Sim3Cdat <- ForWallyFig4$Data[[1]]
distort <- function(x){2*x*as.numeric(x<=1/10) + (2/10 + (8/9)*(x-1/10))*as.numeric(x>1/10)}
## curve(distort,from=0,to=1,axes=FALSE,xlab="True 5-year risk",ylab="Biased (distorted) 5-year risk",lwd=2)
## segments(x0=0,y0=0,x1=1,y1=1,lty=2,col="grey",lwd=2)
## axis(1,at=c(0,0.1,1),labels=c("0","1/10","1"))
## axis(2,las=2,at=c(0,0.2,1),labels=c("0","2/10","1"))
Sim3Cdat$piDistorted <- distort(Sim3Cdat$risk)
# }}}

# {{{ Fig. 4 of the paper
## if(savePlot){
    ## pdf("Fig-paper-4.pdf",width=7.5,height=5)
## }
WallyFig4 <- wallyPlot(Sim3Cdat$piDistorted,
                       time=5,
                       hanging=TRUE,
                       superuser.hide=FALSE,
                       superuser.choice=NULL,
                       formula=Hist(time,status)~1,
                       data=Sim3Cdat,
                       ## ylim=c(-.10,.6),
                       ylim=c(0,.40),
                       seed= 986,
                       ## seed= 7986,
                       mar=c(1.1, 4.1, 1.15, 2))
## if(savePlot){
    ## dev.off()
## }
# show actual data
WallyFig4 <- wallyPlot(Sim3Cdat$piDistorted,
                       time=5,
                       hanging=TRUE,
                       superuser.hide=FALSE,
                       superuser.choice=7,
                       formula=Hist(time,status)~1,
                       data=Sim3Cdat,
                       ## ylim=c(-.10,.6),
                       ylim=c(0,.40),
                       seed= 986,
                       ## seed= 7986,
                       mar=c(1.1, 4.1, 1.15, 2))
# }}}

# }}}
