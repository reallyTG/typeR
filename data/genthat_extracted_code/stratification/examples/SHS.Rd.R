library(stratification)


### Name: SHS
### Title: Data from the 2001 Survey of Household Spending (SHS),
###   Statistics Canada
### Aliases: SHS
### Keywords: datasets

### ** Examples

# Estimation of the response rate
X <- SHS$HHINCTOT[SHS$HHINCTOT>0]
Y <- SHS$M101[SHS$HHINCTOT>0]
Y[Y<0] <- 0
p<-sum(Y>0)/length(Y)

# Study of the relationship between X and Y for the active units
Xactive <- SHS$HHINCTOT[SHS$HHINCTOT>0&SHS$M101>0]
Yactive <- SHS$M101[SHS$HHINCTOT>0&SHS$M101>0]
plot(log(Xactive), log(Yactive))
# Extreme values are omitted for a more robust estimation
keep <- Xactive/Yactive>quantile(Xactive/Yactive,0.01)&
        Xactive/Yactive<quantile(Xactive/Yactive,0.99)    
plot(log(Xactive)[keep], log(Yactive)[keep])
reg <- lm( log(Yactive)[keep]~log(Xactive)[keep] )
summary(reg)

# Stratification assuming X=Y
nomodel <- strata.LH(x=X, CV=0.05, Ls=3, alloc=c(0.5,0,0.5), takeall=0, 
           model="none", algo.control=list(trymany=FALSE, rep=2))
nomodel
var.strata(nomodel, y=Y) # The target CV is far from being reached

# Stratification taking into account a loglinear model with mortality 
# between X and Y, using the estimated parameters values
model <- strata.LH(x=X, CV=0.05, Ls=3, alloc=c(0.5,0,0.5), takeall=0,
         model="loglinear", model.control=list(beta=reg$coef[2],
         sig2=summary(reg)$sigma^2, ph=0.97), initbh=nomodel$bh,
         algo.control=list(trymany=FALSE, rep=2))
model
var.strata(model,y=Y) # The target CV is reached



