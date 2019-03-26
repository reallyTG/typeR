library(highfrequency)


### Name: heavyModelC
### Title: HEAVY Model estimation using C code
### Aliases: heavyModelC
### Keywords: forecasting

### ** Examples
 
 # Implementation of the heavy model on DJI:
 data("realized_library");
 returns =  realized_library$Dow.Jones.Industrials.Returns; 
 rk      =  realized_library$Dow.Jones.Industrials.Realized.Kernel; 
 returns = returns[!is.na(rk)];  rk = rk[!is.na(rk)]; # Remove NA's 
 data = cbind( returns^2, rk ); # Make data matrix with returns and realized measures
 backcast = matrix( c(var(returns),mean(rk)) ,ncol=1);
 
 #For traditional (default) version:
 startvalues = c(0.004,0.02,0.44,0.41,0.74,0.56); # Initial values;
 output = heavyModelC( data = as.matrix(data,ncol=2), compconst=FALSE, 
                    startingvalues = startvalues, backcast=backcast); 
                    
 #For general version: 
 startvalues = c(0.004,0.02,0.44,0.4,0.41,0.74,0.56); # Initial values;
 p = matrix(c(2, 0,0 , 1), ncol = 2);
 q = matrix(c(1,0, 0, 1), ncol = 2);
 
 output = heavyModelC( data = as.matrix(data,ncol=2), p=p, q=q, compconst=FALSE, 
                    startingvalues = startvalues, backcast=backcast); 




