library(OSCV)


### Name: OSCV_Epan_dens
### Title: The OSCV function based on L_E, the one-sided Epanechnikov
###   kernel, in the kernel density estimation (KDE) context.
### Aliases: OSCV_Epan_dens

### ** Examples

## Not run: 
##D # Example 1 (Data on n=272 eruption duration of the Old Faithful geyser).
##D data=faithful[,1]
##D har=seq(0.05,1,len=1000)
##D dev.new()
##D plot(har,OSCV_Epan_dens(har,data),lwd=3,'l',xlab="h",ylab="L_E-based OSCV",
##D main="L_E_based OSCV for the data on eruption duration",cex.main=1.5,cex.lab=1.7,cex.axis=1.7)
##D h_min=round(optimize(OSCV_Epan_dens,c(0.001,1),tol=0.001,dat=data)$minimum, digits=4)
##D legend(0.1,-0.1,legend=c("n=272",paste("h_min=",h_min)),cex=2)
##D # The above graph appears in Savchuk (2017).
##D 
##D # Example 2 (Data set of size n=100 is generated from the standard normal density).
##D dat_norm=rnorm(100)
##D harray=seq(0.25,4.25,len=1000)
##D OSCVarray=OSCV_Epan_dens(harray,dat_norm)
##D dev.new()
##D plot(harray,OSCVarray,lwd=3,'l',xlab="h",ylab="L_E-based OSCV",
##D main="L_E-based OSCV for data generated from N(0,1)", cex.main=1.5,cex.lab=1.7,cex.axis=1.7)
##D h_min_norm=round(optimize(OSCV_Epan_dens,c(0.1,4),tol=0.001,dat=dat_norm)$minimum, digits=4)
##D legend(0.5,OSCVarray[1],legend=c("n=100",paste("h_min=",h_min_norm)),cex=2,bty="n")
## End(Not run)



