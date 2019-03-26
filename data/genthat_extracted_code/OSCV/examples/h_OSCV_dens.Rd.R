library(OSCV)


### Name: h_OSCV_dens
### Title: The OSCV bandwidth in the density estimation context.
### Aliases: h_OSCV_dens

### ** Examples

## Not run: 
##D data=faithful[,1]         # Data on n=272 eruption duration of the Old Faithful geyser.
##D harray=seq(0.025,0.6,len=100)
##D OSCV_array=OSCV_Gauss_dens(harray,data,0)
##D dev.new()
##D plot(harray,OSCV_array,lwd=3,'l',xlab="h",ylab="L_G-based OSCV",
##D main="OSCV_G(h) for the data on eruption duration",cex.main=1.5,cex.lab=1.7,cex.axis=1.7)
##D h_oscv=round(h_OSCV_dens(data,0),digits=4) #smoothness of the underlying density is assumed
##D legend(0.04,-0.25,legend=c("n=272",paste("h_OSCV=",h_oscv)),cex=2,bty="n")
## End(Not run)



