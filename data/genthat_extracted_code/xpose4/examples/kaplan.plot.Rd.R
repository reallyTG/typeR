library(xpose4)


### Name: kaplan.plot
### Title: Kaplan-Meier plots of (repeated) time-to-event data
### Aliases: kaplan.plot

### ** Examples


## Not run: 
##D library(xpose4)
##D 
##D ## Read in the data
##D runno <- "57"
##D xpdb <- xpose.data(runno)
##D 
##D ####################################
##D # here are the real data plots
##D ####################################
##D 
##D kaplan.plot(x="TIME",y="DV",object=xpdb)
##D kaplan.plot(x="TIME",y="DV",object=xpdb,
##D             events.to.plot=c(1,2),
##D             by=c("DOSE==0","DOSE!=0"))
##D kaplan.plot(x="TIME",y="DV",object=xpdb,
##D             events.to.plot=c(1,2),
##D             by=c("DOSE==0","DOSE==10",
##D             "DOSE==50","DOSE==200"))
##D 
##D ## make a PDF of the plots
##D pdf(file=paste("run",runno,"_kaplan.pdf",sep=""))
##D kaplan.plot(x="TIME",y="DV",object=xpdb,
##D             by=c("DOSE==0","DOSE==10",
##D             "DOSE==50","DOSE==200"))
##D dev.off()
##D 
##D ####################################
##D ## VPC plots
##D ####################################
##D 
##D kaplan.plot(x="TIME",y="DV",object=xpdb,VPC=T,events.to.plot=c(1))
##D kaplan.plot(x="TIME",y="DV",object=xpdb,VPC=T,
##D             events.to.plot=c(1,2,3),
##D             by=c("DOSE==0","DOSE!=0"))
##D kaplan.plot(x="TIME",y="DV",object=xpdb,VPC=T,
##D             events.to.plot=c(1),
##D             by=c("DOSE==0","DOSE==10","DOSE==50","DOSE==200"))
##D 
##D ## make a PDF of all plots
##D pdf(file=paste("run",runno,"_kaplan.pdf",sep=""))
##D kaplan.plot(x="TIME",y="DV",object=xpdb,VPC=T,
##D             by=c("DOSE==0","DOSE==10","DOSE==50","DOSE==200"))
##D dev.off()
## End(Not run)




