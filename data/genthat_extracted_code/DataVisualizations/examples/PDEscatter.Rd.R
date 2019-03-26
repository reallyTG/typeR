library(DataVisualizations)


### Name: PDEscatter
### Title: Scatter Density Plot
### Aliases: PDEscatter
### Keywords: scatter scatter plot scatter density plot PDE Density
###   Estimation

### ** Examples

#taken from [Thrun/Ultsch, 2018]
data("ITS")
data("MTY")
Inds=which(ITS<900&MTY<8000)
plot(ITS[Inds],MTY[Inds],main='Bimodality is not visible in normal scatter plot')
## No test: 
PDEscatter(ITS[Inds],MTY[Inds],xlab = 'ITS in EUR',

ylab ='MTY in EUR' ,main='Pareto Density Estimation indicates Bimodality' )
## End(No test)
## Don't show: 

PDEscatter(ITS[1:10],MTY[1:10],xlab = 'ITS in EUR',

ylab ='MTY in EUR' ,main='Pareto Density Estimation indicates Bimodality' )
## End(Don't show)



