library(CDVine)


### Name: CDVineClarkeTest
### Title: Clarke test comparing two vine copula models
### Aliases: CDVineClarkeTest

### ** Examples

## Not run: 
##D # load data set
##D data(worldindices)
##D d = dim(worldindices)[2]
##D 
##D # select the C-vine families and parameters
##D cvine = CDVineCopSelect(worldindices,c(1:6),type="CVine")
##D 
##D # select the D-vine families and parameters
##D dvine = CDVineCopSelect(worldindices,c(1:6),type="DVine")
##D 
##D # compare the two models based on the data
##D clarke = CDVineClarkeTest(worldindices,1:d,1:d,cvine$family,dvine$family,
##D                           cvine$par,dvine$par,cvine$par2,dvine$par2,
##D                           Model1.type=1,Model2.type=2)
##D clarke$statistic
##D clarke$statistic.Schwarz
##D clarke$p.value
##D clarke$p.value.Schwarz
## End(Not run)



