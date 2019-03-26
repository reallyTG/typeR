library(OSCV)


### Name: OSCV_LI_dens
### Title: The OSCV function based on the kernel 'L_I' in the density
###   estimation (KDE) context.
### Aliases: OSCV_LI_dens

### ** Examples

## Not run: 
##D # Example 1 (Old Faithful geyser data)
##D dev.new()
##D data=faithful[,1]         # Data on n=272 eruption duration of the Old Faithful geyser.
##D harray=seq(0.025,0.6,len=50)
##D alp=16.8954588
##D sig=1.01
##D plot(harray,OSCV_LI_dens(harray,data,alpha=alp,sigma=sig),lwd=3,'l',xlab="h",
##D ylab="L_I-based OSCV",main="OSCV_LI(h) for eruption duration",cex.main=1.5,cex.lab=1.7,
##D cex.axis=1.7)
##D h_OSCV_LI=round(optimize(OSCV_LI_dens,c(0.001,0.5),tol=0.001,dat=data,alpha=16.8954588,
##D sigma=1.01)$minimum,digits=4)
##D legend(0.01,-0.2,legend=c("n=272",paste("h_OSCV_LI=",h_OSCV_LI)),cex=1.8,bty="n")
##D legend(0.25,-0.33,legend=c("Parameters of L_I:", paste("alpha=",alp),
##D paste("sigma=",sig)),cex=1.7,bty="n")
##D 
##D # Example 2 (Simulated example)
##D dat_norm=rnorm(100)   #generating a random sample of size n=100 from the N(0,1) density
##D harray=seq(0.05,1.5,len=100)
##D OSCVarray=OSCV_LI_dens(harray,dat=dat_norm,16.8954588,1.01)
##D dev.new()
##D plot(harray,OSCVarray,lwd=3,'l',xlab="h",ylab="L_I-based OSCV",
##D main="OSCV_LI(h) for data generated from N(0,1)",cex.main=1.5,cex.lab=1.7,cex.axis=1.7)
##D h_OSCV_LI_norm=round(optimize(OSCV_LI_dens,c(0.001,1),tol=0.001,
##D dat=dat_norm,16.8954588,1.01)$minimum,digits=4)
##D legend(0,OSCVarray[1],legend=c("n=100",paste("h_OSCV_LI=",h_OSCV_LI_norm),
##D "Parameters of the robust kernel L_I:","alpha=16.8954588", "sigma=1.01"),cex=1.5,bty="n")
## End(Not run)



