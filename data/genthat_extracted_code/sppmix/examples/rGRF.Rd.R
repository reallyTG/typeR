library(sppmix)


### Name: rGRF
### Title: Generate a Gaussian Random Field
### Aliases: rGRF

### ** Examples

## No test: 
#Gaussian random field as an image
GRF1=rGRF()
p<-plot_density(as.data.frame(GRF1))
p_title<-expression( paste("GRF with Matern covariances, ", theta,"=1,",mu,"=0,",nu, "=.5,",
 sigma,"=1"))
p+ggplot2::ggtitle(p_title)
#or simply use the add_title function
p+add_title("GRF with Matern model covariances", mu=0,theta=1,nu=.5,sigma=1)
#Chi-Square random field as an image
ChiSqRF=rGRF(gentype=1,df=10)
p<-plot_density(as.data.frame(ChiSqRF))
p+add_title(paste(chi^{2}," random fields with Matern model covariances for the GRFs"),
mu=0,theta=1,nu=.5,sigma=1,df=10)
#Log-Gaussian random field as an image
GRF2=rGRF()
LogGRF=exp(rGRF())
p<-plot_density(as.data.frame(LogGRF))
p+add_title("Log-Gaussian random field with Matern model covariances", mu=0,theta=1,
 nu=.5,sigma=1)
## End(No test)




