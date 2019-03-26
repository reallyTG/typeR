library(cuttlefish.model)


### Name: two.stage.model.outputs
### Title: Two-stage biomass model output estimation
### Aliases: two.stage.model.outputs
### Keywords: ~kwd1 ~kwd2

### ** Examples


data(input.data)

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


#B1 time series estimated by the two.stage.model.fit and optim functions
B1.time.series<-c(13321.68, 15162.38, 10461.95, 23642.48, 15213.79)

#Catchabilities estimated by the two.stage.model.fit and optim functions
kq<-c(-9.699609, -9.955116, -9.974922, -9.578453)

#g parameter
growth<--1.01


two.stage.model.results<-two.stage.model.outputs(B1=B1.time.series, 
catchability=kq, obs=lpue.obs, g=growth)

two.stage.model.results




