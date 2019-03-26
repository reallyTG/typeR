library(Rcapture)


### Name: lesbian
### Title: Epidemiological capture-recapture Data on the lesbian population
### Aliases: lesbian
### Keywords: datasets

### ** Examples

data(lesbian)

closedp(lesbian, dfreq = TRUE)

# According to the BIC, the best model is Mth Darroch.
# Let's see if adding  interactions between capture 
# histories to the model could improve the model's fit.

closedpMS.t(lesbian, dfreq = TRUE, h = "Darroch")

# According to the BIC, the best heterogeneous Darroch model
# contains the double interactions 12, 13, 14. 



