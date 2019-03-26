library(bayescount)


### Name: bayescount
### Title: Analyse Count data using MCMC
### Aliases: bayescount
### Keywords: models

### ** Examples


# run the function with all values as default, and 'name' and 'data' 
# (from a local .csv file) to be input by the user when prompted:
# bayescount()

# analyse local data (2 datasets with 20 animals each with 10 repeat 
# samples) using a zero-inflated lognormal Poisson model:
## Not run: 
##D # Simulate some data:
##D data <- array(dim=c(20,10,2))
##D means1 <- rgamma(20, 10, 1)
##D means2 <- rgamma(20, 5, 1)
##D for(i in 1:20){
##D 	data[i,,1] <- rpois(10, means1[i])
##D 	data[i,,2] <- rpois(10, means2[i])
##D }
##D # Missing data is permissible but means the likelihood cannot be 
##D # calculated - a warning will be printed:
##D data[sample(1:(20*10*2), 10)] <- NA
##D try(unlink("analysis.ZILP.csv"), silent=TRUE)
##D # Run the analysis:
##D bayescount(name="analysis", data=data, model = "ZILP", 
##D setnames=c("Simulated group A", "Simulated group B"), likelihood=TRUE)
## End(Not run)




