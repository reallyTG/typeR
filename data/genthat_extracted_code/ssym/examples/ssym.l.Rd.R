library(ssym)


### Name: ssym.l
### Title: Fitting Semi-parametric Log-symmetric Regression Models
### Aliases: ssym.l

### ** Examples


###################################################################################
######### Fraction of Cell Volume Data - a log-power-exponential model  ###########
###################################################################################
#data("Ovocytes", package="ssym")
#fit <- ssym.l(log(fraction) ~ type + psp(time) | type + psp(time),
#               data=Ovocytes, family='Powerexp', xi=-0.55, local.influence=TRUE)
#summary(fit)
#
################## Graph of the nonparametric effects ##################
#par(mfrow=c(1,2))
#np.graph(fit, which=1, exp=TRUE)
#np.graph(fit, which=2, exp=TRUE)
#
################## Graph of deviance-type residuals ##################
#plot(fit)
#
################### Simulated envelopes ##################
#envelope(fit)
#
################### Graph of local influence measures ##################
#out <- influence(fit)

###################################################################################
############### Textures of snacks Data - a log-Student-t model  #################
###################################################################################
#data("Snacks", package="ssym")
#fit <- ssym.l(log(texture) ~ type + ncs(week) | type, data=Snacks,
#        family='Student', xi=15, local.influence=TRUE)
#summary(fit)
#
############################ Extra parameter ###########################
#extra.parameter(fit,5,50)
#
################### Graph of the nonparametric effect ##################
#np.graph(fit, which=1, exp=TRUE)
#
################### Graph of deviance-type residuals ##################
#plot(fit)
#
################### Simulated envelopes ##################
#envelope(fit)
#
################### Plot of influence measures ##################
#out <- influence(fit)

###################################################################################
################### Daphnia Data - a log-normal model ########################
###################################################################################
#data("daphnia", package="nlreg")
#fit <- ssym.l(log(time) ~ ncs(conc) | ncs(conc), data=daphnia, family="Normal")
#summary(fit)
#
################### Graph of the nonparametric effects ##################
#par(mfrow=c(1,2))
#np.graph(fit, which=1, exp=TRUE)
#np.graph(fit, which=2, exp=TRUE)
#
################### Simulated envelopes ##################
#envelope(fit)

###################################################################################
####################### gam.data - a Power-exponential model   ####################
###################################################################################
#data("gam.data", package="gam")
#
#fit <- ssym.l(y~psp(x),data=gam.data,family="Powerexp",xi=-0.5)
#summary(fit)
#
################## Graph of the nonparametric effect ##################
#np.graph(fit, which=1)
#
###################################################################################
######### Personal Injury Insurance Data - a Birnbaum-Saunders-t model   ##########
###################################################################################
#data("Claims", package="ssym")
#fit <- ssym.l(log(total) ~ op_time | op_time, data=Claims,
#        family='Sinh-t', xi=c(0.1,4), local.influence=TRUE)
#summary(fit)
#
################## Plot of deviance-type residuals ##################
#plot(fit)
#
################### Simulated envelopes ##################
#envelope(fit)
################## Plot of influence measures ##################
#out <- influence(fit)

###################################################################################
######### Body Fat Percentage Data - a Birnbaum-Saunders-t model   ##########
###################################################################################
#data("ais", package="sn")
#fit <- ssym.l(log(Bfat)~1, data=ais, family='Sinh-t', xi=c(4.5,4))
#summary(fit)
#
########################### Extra parameter ###########################
#extra.parameter(fit,c(3,4),c(5,7))
#
################## Plot of the fitted model ##################
#id <- sort(ais$Bfat, index=TRUE)$ix
#par(mfrow=c(1,2))
#hist(ais$Bfat[id],xlim=range(ais$Bfat),ylim=c(0,0.1),prob=TRUE,breaks=15,
#     col="light gray",border="dark gray",xlab="",ylab="",main="")
#par(new=TRUE)
#plot(ais$Bfat[id],exp(fit$lpdf[id])/ais$Bfat[id],xlim=range(ais$Bfat),
#     ylim=c(0,0.1),type="l",xlab="",ylab="Density",main="Histogram")
#	 
#plot(ais$Bfat[id],fit$cdfz[id],xlim=range(ais$Bfat),ylim=c(0,1),type="l",
#     xlab="",ylab="",main="")
#par(new=TRUE)
#plot(ecdf(ais$Bfat[id]),xlim=range(ais$Bfat),ylim=c(0,1),verticals=TRUE,
#     do.points=FALSE,col="dark gray",ylab="Probability",xlab="",main="ECDF")

###################################################################################
################### ALCOA Aluminium Data - a log-slash model   ####################
###################################################################################

#data("alcoa", package="robustloggamma")
#alcoa2 <- data.frame(alcoa$dist[alcoa$label=="C"])
#colnames(alcoa2) <- "dist"
#
#fit <- ssym.l(log(dist) ~ 1, data=alcoa2, family="Slash", xi=1.212)
#
################## Plot of the fitted model ##################
#id <- sort(alcoa2$dist, index=TRUE)$ix
#par(mfrow=c(1,2))
#hist(alcoa2$dist[id],xlim=c(0,45),ylim=c(0,0.1),prob=TRUE,breaks=60,
#     col="light gray",border="dark gray",xlab="",ylab="",main="")
#par(new=TRUE)
#plot(alcoa2$dist[id],exp(fit$lpdf[id])/alcoa2$dist[id],xlim=c(0,45),
#ylim=c(0,0.1), type="l",xlab="",ylab="",main="")
#	 
#plot(alcoa2$dist[id],fit$cdfz[id],xlim=range(alcoa2$dist),ylim=c(0,1),type="l",
#     xlab="",ylab="",main="")
#par(new=TRUE)
#plot(ecdf(alcoa2$dist[id]),xlim=range(alcoa2$dist),ylim=c(0,1),verticals=TRUE,
#     do.points=FALSE,col="dark gray",ylab="",xlab="",main="")

##################################################################################
################### Boston Housing Data - a log-Slash model   ####################
###################################################################################
#data("Boston", package="MASS")
#fit <- ssym.l(log(medv) ~ crim + rm + tax + psp(lstat) + psp(dis) | psp(lstat),
#              data=Boston, family="Slash", xi=1.56, local.influence=TRUE)
#summary(fit)
#
########################### Extra parameter ###########################
#extra.parameter(fit,1.0,2.3)
#
################## Plot of deviance-type residuals ##################
#plot(fit)
#
################## Plot of nonparametric effects ##################
#par(mfrow=c(1,3))
#np.graph(fit,which=1,exp=TRUE,"lstat")
#np.graph(fit,which=1,exp=TRUE,"dis")
#np.graph(fit,which=2,exp=TRUE,"lstat")
#
################## Plot of influence measures ##################
#out <- influence(fit)
#
################### Simulated envelopes ##################
#envelope(fit)

###################################################################################
####################### mcycle Data - a Power-exponential model   #################
###################################################################################
#data("mcycle", package="MASS")
#fit <- ssym.l(accel ~ ncs(times)|ncs(times), data=mcycle, family="Powerexp",xi=-0.6)
#summary(fit)
#
################## Plot of nonparametric effects ##################
#par(mfrow=c(1,2))
#np.graph(fit,which=1,obs=TRUE)
#np.graph(fit,which=2,exp=TRUE,obs=TRUE)
#
################### Simulated envelopes ##################
#envelope(fit)

###################################################################################
################### Steel Data - a log-hyperbolic model   ####################
###################################################################################
#data("Steel", package="ssym")
#fit <- ssym.l(log(life)~psp(stress), data=Steel, family="Hyperbolic", xi=1.25)
#summary(fit)
#
########################### Extra parameter ###########################
#extra.parameter(fit,0.5,2)
#
################## Plot of nonparametric effects ##################
#np.graph(fit,which=1,exp=TRUE)
	 



