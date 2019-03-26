library(ssym)


### Name: ssym.nl
### Title: Fitting Semi-parametric Log-symmetric Regression Models
### Aliases: ssym.nl

### ** Examples


###################################################################################
######### Ultrasonic Calibration Data - a log-contaminated-normal model ###########
###################################################################################
#data("Chwirut1", package="NISTnls")
#fit<-ssym.nl(log(y) ~ -b1*x-log(b2 + b3*x)|x,start=c(b1=0.15,b2=0.005,b3=0.012),
#      data=Chwirut1, family='Contnormal', xi=c(0.68,0.1), local.influence=TRUE)
#summary(fit)
#
########################### Extra parameter ###########################
#extra.parameter(fit,c(0.4,0.08),c(0.9,0.11))
#
################## Graph of deviance-type residuals ##################
#plot(fit)
#
################## Simulated envelopes ##################
#envelope(fit)
#
################## Graph of local influence measures ##################
#out <- influence.ssym(fit)

###################################################################################
################## Biaxial Fatigue Data - a Birnbaum-Saunders model   #############
###################################################################################
#data("Biaxial", package="ssym")
#fit <- ssym.nl(log(Life) ~ b1*Work^b2, start=c(b1=16, b2=-0.25),
#                data=Biaxial, family='Sinh-normal', xi=1.54)
#summary(fit)
#
########################### Extra parameter ###########################
#extra.parameter(fit,1.3,1.8)
#
################## Graph of deviance-type residuals ##################
#plot(fit)
#
################## Simulated envelopes ##################
#envelope(fit,reps=100,conf=0.95)
###################################################################################
################## European rabbits Data - a log-normal model   #############
###################################################################################
#data("Erabbits", package="ssym")
#fit <- ssym.nl(log(wlens) ~ b1 - b2/(b3 + age) | age, start=c(b1=5,
#               b2=130, b3=36), data=Erabbits, family='Normal')
#summary(fit)
#
################## Graph of deviance-type residuals ##################
#plot(fit)
#
################## Simulated envelopes ##################
#envelope(fit)
#
###################################################################################
################### Metsulfuron Data - a log-Student-t model ######################
###################################################################################
#data("M4", package="nlreg")
#fit <- ssym.nl(log(area) ~ log(b1+(b2-b1)/(1+(dose/b3)^b4))|ncs(dose), data=M4,
#       start = c(b1=4, b2=1400, b3=0.11, b4=1.23), family="Student", xi=6)
#summary(fit)
#
########################### Extra parameter ###########################
#extra.parameter(fit,3,10)
#
################## Graph of deviance-type residuals ##################
#plot(fit)
#
################## Graph of the nonparametric effect ##################
#np.graph(fit,which=2,"dose")
#
################## Simulated envelopes ##################
#envelope(fit)
#
###################################################################################
################# Blood flow Data - a log-power-exponential model #################
###################################################################################
#data("la", package="gamlss.nl")
#fit <- ssym.nl(log(PET60) ~ log(bflow) + log(1+b1*exp(-b2/bflow)) | bflow,
#       data=la, start=c(b1=-0.6,b2=98), family="Powerexp", xi=-0.45)
#summary(fit)
#
########################### Extra parameter ###########################
#extra.parameter(fit,-0.5,0)
################## Graph of deviance-type residuals ##################
#plot(fit)
#
################## Simulated envelopes ##################
#envelope(fit,reps=100,conf=0.99)
#
###################################################################################
######### Gross Domestic Product per capita Data - a Birnbaum-Saunders model ######
###################################################################################
#data("gdp", package="ssym")
#fit <- ssym.nl(log(gdp2010) ~ b1, start=c(b1=mean(log(gdp$gdp2010))), data=gdp, 
#               family='Sinh-normal', xi=2.2)
#summary(fit)
########################### Extra parameter ###########################
#extra.parameter(fit,0.5,3)
################## Plot of the fitted model ##################
#id <- sort(gdp$gdp2010, index=TRUE)$ix
#par(mfrow=c(1,2))
#hist(gdp$gdp2010[id],xlim=range(gdp$gdp2010),ylim=c(0,0.00025),prob=TRUE,
#     breaks=200,col="light gray",border="dark gray",xlab="",ylab="",main="")
#par(new=TRUE)
#plot(gdp$gdp2010[id],exp(fit$lpdf[id])/gdp$gdp2010[id],xlim=range(gdp$gdp2010),
#     ylim=c(0,0.00025),type="l",xlab="",ylab="Density",main="Histogram")
#	 
#plot(gdp$gdp2010[id],fit$cdfz[id],xlim=range(gdp$gdp2010),ylim=c(0,1),type="l",
#     xlab="",ylab="",main="")
#par(new=TRUE)
#plot(ecdf(gdp$gdp2010[id]),xlim=range(gdp$gdp2010),ylim=c(0,1),verticals=TRUE,
#     do.points=FALSE,col="dark gray",ylab="Probability.",xlab="",main="ECDF")
###################################################################################
############# Australian Institute of Sport Data - a log-normal model #############
###################################################################################
#data("ais", package="sn")
#sex <- ifelse(ais$sex=="male",1,0)
#ais2 <- data.frame(BMI=ais$BMI,LBM=ais$LBM,sex)
#start = c(b1=7, b2=0.3, b3=2)
#fit <- ssym.nl(log(BMI) ~ log(b1 + b2*LBM + b3*sex) | sex + LBM,
#               data=ais2, start=start, family="Normal")
#summary(fit)
#
################## Graph of deviance-type residuals ##################
#plot(fit)
#
################## Simulated envelopes ##################
#envelope(fit)
#
###################################################################################
################ Daphnia Data - a log-power-exponential model #####################
###################################################################################
#data("daphnia", package="nlreg")
#fit <- ssym.nl(log(time) ~ log(b1+(b2-b1)/(1+(conc/b4)^b3)) | ncs(conc),
#       data=daphnia, start = c(b1=0, b2=50 , b3=2, b4=0.2), family="Powerexp",
#		xi=-0.42)
#summary(fit)
#
########################### Extra parameter ###########################
#extra.parameter(fit,-0.5,-0.3)
#
################## Graph of deviance-type residuals ##################
#plot(fit)
#
################## Graph of the nonparametric effect ##################
#np.graph(fit,which=2,"conc")
#
################## Simulated envelopes ##################
#envelope(fit)



