library(CMplot)


### Name: CMplot-package
### Title: Circle Manhattan Plot
### Aliases: CMplot-package CMplot

### ** Examples


#plot rectangular Manhattan only one trait with 20000 markers:
data(pig60K)                        
CMplot(pig60K[sample(1:nrow(pig60K), 10000),c(1:4)],plot.type="m",
	  threshold=c(0.01,0.05)/nrow(pig60K),threshold.col=c('red','orange'),
	  multracks=FALSE, chr.den.col=NULL)
 
################################################################################
#plot circular Manhattan for all traits with all markers:                      #
################################################################################
#data(pig60K)                                                                  #         
#CMplot(pig60K,col=c("gray30","gray60"),r=0.5,plot.type="c",threshold=0.01,    #
#		signal.col=NULL,outward=TRUE)                                          #
################################################################################




