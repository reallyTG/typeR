library(highfrequency)


### Name: heavyModel
### Title: HEAVY Model estimation
### Aliases: heavyModel
### Keywords: forecasting

### ** Examples
 
 # Implementation of the heavy model on DJI:
 data("realized_library");
 returns =  realized_library$Dow.Jones.Industrials.Returns; 
 rk      =  realized_library$Dow.Jones.Industrials.Realized.Kernel; 
 returns = returns[!is.na(rk)];  rk = rk[!is.na(rk)]; # Remove NA's 
 data = cbind( returns^2, rk ); # Make data matrix with returns and realized measures
 backcast = matrix( c(var(returns),mean(rk)) ,ncol=1);
 
 startvalues = c(0.004,0.02,0.44,0.41,0.74,0.56); # Initial values
# output = heavyModel( data = as.matrix(data,ncol=2), compconst=FALSE, 
#                    startingvalues = startvalues, backcast=backcast); 



