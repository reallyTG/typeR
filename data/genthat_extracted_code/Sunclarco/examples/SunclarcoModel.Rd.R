library(Sunclarco)


### Name: SunclarcoModel
### Title: Sunclarco Model
### Aliases: SunclarcoModel

### ** Examples

## Don't show: 
data("insem",package="Sunclarco")
insemsub <- insem[insem$Herd<=10,]
result1 <- SunclarcoModel(data=insemsub,time="Time",status="Status",
                          clusters="Herd",covariates="Heifer",
                          stage=1,copula="Clayton",marginal="Weibull")
## End(Don't show) 
## Not run: 
##D data("insem",package="Sunclarco")
##D result1 <- SunclarcoModel(data=insem,time="Time",status="Status",
##D                           clusters="Herd",covariates="Heifer",
##D                           stage=1,copula="Clayton",marginal="Weibull")
##D 
##D summary(result1)
##D 
##D result2 <- SunclarcoModel(data=insem,time="Time",status="Status",
##D                           clusters="Herd",covariates="Heifer",
##D                           stage=1,copula="GH",marginal="PiecewiseExp")
##D summary(result2)
##D 
##D 
##D result3 <- SunclarcoModel(data=kidney,time="time",status="status",
##D                           clusters="id",covariates="sex",
##D                           stage=2,copula="Clayton",marginal="Weibull")
##D 
##D summary(result3)
##D 
##D result4 <- SunclarcoModel(data=kidney,time="time",status="status",
##D                           clusters="id",covariates="sex",
##D                           stage=2,copula="Clayton",marginal="Cox")
##D 
##D summary(result4)
## End(Not run)



