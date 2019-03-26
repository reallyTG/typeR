library(cuttlefish.model)


### Name: two.stage.model.fit
### Title: Two-stage biomass model fitting function
### Aliases: two.stage.model.fit
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(input.data)

#Abundance indices are re-scaled by dividing the time series by its mean
input.data$bts<-input.data$bts/mean(input.data$bts)
input.data$cgfs<-input.data$cgfs/mean(input.data$cgfs)
input.data$lpue.fr<-input.data$lpue.fr/mean(input.data$lpue.fr)
input.data$lpue.uk<-input.data$lpue.uk/mean(input.data$lpue.uk)

#Creation of a data frame filled with the year, the fishing season, 
#the abundance indices, the landings of the 3 first quarters of the 
#fishing season (used in the modelling of the UK LPUE) and the landings 
#of all the fishing season (used in the modelling of the french LPUE)
lpue.obs<-data.frame(c(1900:1904), 
c(1:5), 
input.data$bts, 
input.data$cgfs, 
input.data$lpue.uk, 
input.data$lpue.fr, 
input.data$landings.q3 + input.data$landings.q4 + input.data$landings.q1, 
input.data$landings.q3 + input.data$landings.q4 + input.data$landings.q1 
+ input.data$landings.q2)
colnames(lpue.obs)<-c("year", "fishing.year", "bts","cgfs","lpue.uk",
"lpue.fr","L.Q341","L.Q3412")

#Growth parameter
growth<--1.01

#Initial values for the fitting with 17 starting values for B1 
#(for the 17 years) and the 4 log values of the catchabilities
biom.init<-c(rep(15000,5),-9, -9, -9, -9)

#Fitting of the two-stage biomass model

result.optim<-optim(par=biom.init,fn=two.stage.model.fit, 
obs.fit=lpue.obs[1:5,], g.fit=-1.01, method = "BFGS",
control=list(maxit=99990,reltol=1e-9,trace=TRUE))

#Plot of the B1 time series
plot(x=input.data$year, y=result.optim$par[1:5], type='b', 
ylim=c(0, max(result.optim$par[1:5])), xlab="Years", 
ylab= "B1 estimation in tons of cuttlefish")




