## ----message=FALSE-------------------------------------------------------
library(InformativeCensoring)

## ------------------------------------------------------------------------
data(nwtco)

#only use first 500 subjects
nwtco <- nwtco[1:500,]
head(nwtco)


## ------------------------------------------------------------------------
#Set random number seed
set.seed(3957129)

## ------------------------------------------------------------------------
nwtco$basegamma <- 1
nwtco$basegamma[nwtco$histol==2] <- NA

## ------------------------------------------------------------------------
#Create the m imputed data sets (a GammaImputedSet object)
imputed.data.sets <- gammaImpute(formula=Surv(edrel,rel)~histol + instit + strata(stage),
                                 data = nwtco, m=10, 
                                 gamma="basegamma", gamma.factor=0.5, DCO.time=6209)

## ------------------------------------------------------------------------
#Fit Cox models onto each imputed data set (a GammaStatList object)
imputed.fits <- ImputeStat(imputed.data.sets)

#Combine the results using Rubin's rules
summary(imputed.fits)

## ------------------------------------------------------------------------
fits.weibull <- ImputeStat(imputed.data.sets,method="weibull",formula=~histol)

## ------------------------------------------------------------------------
imputed.fits$statistics

## ------------------------------------------------------------------------
#for the third data set
imputed.data.set <- ExtractSingle(imputed.data.sets,index=3)

head(imputed.data.set$data)

## ------------------------------------------------------------------------
fifth.fit <- ExtractSingle(imputed.fits,index=5)

print(fifth.fit)

head(residuals(fifth.fit$model,type="schoenfeld"))


## ----fig.cap="Scaled Schoenfeld residuals for histol for the third imputed data set and its model fit. See help(plot.cox.zph) for plotting options",fig.height=5,fig.width=5,fig.align='center'----
test.assump <- cox.zph(imputed.fits,index=3,transform="km")
print(test.assump)
plot(test.assump[1],main="Scaled Schoenfeld Residuals for histol")

## ------------------------------------------------------------------------
set.seed(6110)
#simulate a time to event dataset, with two treatment groups
#note that here we are simulating with non-informative censoring
N <- 1000
gamma.dataset <- data.frame(Id=1:N,
                            DCO.time=rep(3,N))
#Z is a treatment variable, assigned in a 1:1 ratio
gamma.dataset$Z <- c(rep(1,N*0.5),rep(0,N*0.5))

#generate censoring and event times
C <- rexp(n = N,rate = 0.3)
T <- rexp(n = N,rate=0.05*exp(gamma.dataset$Z))
gamma.dataset$Y <- pmin(T,C,3)
gamma.dataset$delta <- 1*((T < C) & (T <3))
gamma.dataset$Z <- factor(gamma.dataset$Z)

## ------------------------------------------------------------------------
obsDataCox <- coxph(Surv(Y,delta) ~ Z, data=gamma.dataset)
summary(obsDataCox)

## ------------------------------------------------------------------------
gamma.dataset$basegamma <- NA
gamma.dataset$basegamma[(gamma.dataset$Y < 3) & (gamma.dataset$Z==1)] <- 1

## ------------------------------------------------------------------------
imputed.data.sets <- gammaImpute(formula=Surv(Y,delta)~Z,
                                   data = gamma.dataset, m=100, gamma="basegamma",
                                   gamma.factor=0, DCO.time="DCO.time")
fits <- ImputeStat(imputed.data.sets)
summary(fits)

## ------------------------------------------------------------------------
gamma.dataset.copy <- gamma.dataset
gamma.dataset.copy$Y[(gamma.dataset.copy$Z==1) & (gamma.dataset.copy$delta==0) & 
                        (gamma.dataset.copy$Y<gamma.dataset.copy$DCO.time)] <- 
  gamma.dataset.copy$Y[(gamma.dataset.copy$Z==1) & (gamma.dataset.copy$delta==0) & 
                         (gamma.dataset.copy$Y<gamma.dataset.copy$DCO.time)]+ 0.0001
gamma.dataset.copy$delta[(gamma.dataset.copy$Z==1) & (gamma.dataset.copy$delta==0) & 
                        (gamma.dataset.copy$Y<gamma.dataset.copy$DCO.time)] <- 1

## ------------------------------------------------------------------------
immFailureCox <- coxph(Surv(Y,delta) ~ Z, data=gamma.dataset.copy)
summary(immFailureCox)

## ------------------------------------------------------------------------
imputed.data.sets <- gammaImpute(formula=Surv(Y,delta)~Z,
                                   data = gamma.dataset, m=100, gamma="basegamma",
                                   gamma.factor=1000, DCO.time="DCO.time")
fits <- ImputeStat(imputed.data.sets)
summary(fits)

## ------------------------------------------------------------------------
gamma.dataset.copy <- gamma.dataset
gamma.dataset.copy$Y[(gamma.dataset.copy$Z==1) & (gamma.dataset.copy$delta==0) & 
                        (gamma.dataset.copy$Y<gamma.dataset.copy$DCO.time)] <- 3

## ------------------------------------------------------------------------
noFailureCox <- coxph(Surv(Y,delta) ~ Z, data=gamma.dataset.copy)
summary(noFailureCox)

## ------------------------------------------------------------------------
imputed.data.sets <- gammaImpute(formula=Surv(Y,delta)~Z,
                                   data = gamma.dataset, m=100, gamma="basegamma",
                                   gamma.factor=-1000, DCO.time="DCO.time")
fits <- ImputeStat(imputed.data.sets)
summary(fits)

## ----eval=TRUE,fig.cap="Estimates for log HR comparing group 1 to group 0, as a function of gamma with 95\\% confidence interval. Note that gamma=0 corresponds to assuming non-informative censoring.",fig.height=5,fig.width=5,fig.align='center'----
#we now define a function which will apply the gamma imputation and return
#the model fit results. Note we will only ask for imputation in Z=1 group
#by setting 
my.imputation.function <- function(gamma.factor){
  imputed.data.sets <- gammaImpute(formula=Surv(Y,delta)~Z,
                                   data = gamma.dataset, m=10, gamma="basegamma",
                                   gamma.factor=gamma.factor, DCO.time="DCO.time")
  fits <- ImputeStat(imputed.data.sets)
  return(summary(fits))
}

#set random seed 
set.seed(12123)

#we will impute across the following sequence of gamma values
gamma.factor <- seq(-7,7) 

#perform the imputations
answers <- lapply(gamma.factor,my.imputation.function)

#extract out the Z=1 vs Z=0 results into a matrix and add gamma column
Z1 <- do.call("rbind",lapply(answers,function(x)x["Z1",]))
Z1 <- cbind(Z1,gamma.factor)
head(Z1)
#ylim=c(-0.5,2)
plot(gamma.factor,Z1[,"est"],type="l",ylim=c(-0.5,2.5),ylab="log HR for Z=1 vs. Z=0",
     xlab="Increase in log hazard after censoring: gamma")
lines(gamma.factor,Z1[,"lo 95"],lty=2)
lines(gamma.factor,Z1[,"hi 95"],lty=2)
abline(v=0)

