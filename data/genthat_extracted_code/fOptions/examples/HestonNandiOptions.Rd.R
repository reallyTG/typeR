library(fOptions)


### Name: HestonNandiOptions
### Title: Option Price for the Heston-Nandi Garch Option Model
### Aliases: HestonNandiOptions HNGOption HNGGreeks HNGCharacteristics
### Keywords: math

### ** Examples

## model -
   # Define the Model Parameters for a Heston-Nandi Option:
   model = list(lambda = -0.5, omega = 2.3e-6, alpha = 2.9e-6, 
     beta = 0.85, gamma = 184.25) 
   S = X = 100
   Time.inDays = 252
   r.daily = 0.05/Time.inDays
   sigma.daily = sqrt((model$omega + model$alpha) /
     (1 - model$beta - model$alpha * model$gamma^2))
   data.frame(S, X, r.daily, sigma.daily)

## HNGOption -
   # Compute HNG Call-Put and compare with GBS Call-Put:
   HNG = GBS = Diff = NULL
   for (TypeFlag in c("c", "p")) {
     HNG = c(HNG, HNGOption(TypeFlag, model = model, S = S, X = X, 
       Time.inDays = Time.inDays, r.daily = r.daily)$price )
     GBS = c(GBS, GBSOption(TypeFlag, S = S, X = X, Time = Time.inDays, 
       r = r.daily, b = r.daily, sigma = sigma.daily)@price) }
   Options = cbind(HNG, GBS, Diff = round(100*(HNG-GBS)/GBS, digits=2))
   row.names(Options) <- c("Call", "Put")
   data.frame(Options)
     
## HNGGreeks -
   # Compute HNG Greeks and compare with GBS Greeks:
   Selection = c("Delta", "Gamma")
   HNG = GBS = NULL
   for (i in 1:2){
     HNG = c(HNG, HNGGreeks(Selection[i], TypeFlag = "c", model = model, 
       S = 100, X = 100, Time = Time.inDays, r = r.daily) ) 
     GBS = c(GBS, GBSGreeks(Selection[i], TypeFlag = "c", S = 100, X = 100, 
       Time = Time.inDays, r = r.daily, b = r.daily, sigma = sigma.daily) ) }
   Greeks = cbind(HNG, GBS, Diff = round(100*(HNG-GBS)/GBS, digits = 2))
   row.names(Greeks) <- Selection
   data.frame(Greeks)



