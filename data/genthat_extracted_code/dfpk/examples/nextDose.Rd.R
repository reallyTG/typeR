library(dfpk)


### Name: nextDose
### Title: Next dose determination of a phase I clinical trial.
### Aliases: nextDose

### ** Examples

  ## Not run: 
##D doses <- c(12.59972,34.65492,44.69007,60.80685,83.68946,100.37111)
##D theta <- 0.2 
##D options <- list(nchains = 4, niter = 4000, nadapt = 0.9)     
##D AUCs <- c(1.208339,  5.506040,  6.879835,  3.307928,  3.642430, 
##D           10.271291,  3.885522,  3.086622,  2.537158,  5.525917,  
##D           8.522176,  4.642741, 11.048531, 10.246976,  5.226807)
##D x <- c(1, 2, 3, 4, 5, 6, 4, 4, 4, 5, 5, 4, 4, 5, 5)
##D y <- c(0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0)
##D nextD <- nextDose(model = "pktox", y=y, AUCs=AUCs, doses=doses, 
##D                   x=x, theta=theta, options=options)
## End(Not run)




