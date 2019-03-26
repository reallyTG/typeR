library(RobustAFT)


### Name: predict.TML
### Title: Predict method for "TML" objects
### Aliases: predict.TML

### ** Examples

## Not run: 
##D      data(D243)
##D      Cost <- D243$Cost                             # Cost (Swiss francs)
##D      LOS  <- D243$LOS                              # Length of stay (days)
##D      Adm  <- D243$Typadm; Adm <- (Adm==" Urg")*1   # Type of admission 
##D                                                    # (0=on notification, 1=Emergency)
##D 
##D      # Fitting the model
##D      z    <- TML.noncensored(log(Cost)~log(LOS)+Adm, errors="logWeibull")
##D 
##D      # With a vector of data
##D      vec  <- c(1, 2.4, 1)
##D      predict(object = z, newdata = vec)
##D      # With a matrix of data
##D      mat  <- matrix(c(1,1,2.4,2.7,1,0), ncol=3)
##D      predict(z, mat)
##D      # With a data frame
##D      dat  <- as.data.frame(cbind("intercept"=c(1,1,1), "log(LOS)"=c(2.4,2.7,2.2), 
##D              "Adm"=c(1,0,1)))
##D      predict(z, dat)
## End(Not run)



