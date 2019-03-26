library(RobustAFT)


### Name: TML.noncensored
### Title: Truncated Maximum Likelihood Regression Without Censored
###   Observations
### Aliases: TML.noncensored
### Keywords: Regression Robust Accelerated Failure Time

### ** Examples


## Not run: 
##D      data(D243)
##D      Cost <- D243$Cost                             # Cost (Swiss francs)
##D      LOS  <- D243$LOS                              # Length of stay (days)
##D      Adm  <- D243$Typadm; Adm <- (Adm==" Urg")*1   # Type of admission 
##D                                                    # (0=on notification, 1=Emergency)
##D      Ass  <- D243$Typass; Ass <- (Ass=="P"   )*1   # Type of insurance 
##D                                                    # (0=usual, 1=private)
##D      Age  <- D243$age                              # Age (years)
##D      Dst  <- D243$dest;   Dst <- (Dst=="DOMI")*1   # Destination 
##D                                                    # (1=Home, 0=another hospital)
##D      Sex  <- D243$Sexe;   Sex <- (Sex=="M"   )*1   # Sex (1=Male, 0=Female)
##D 
##D      # Truncated maximum likelihood regression with Gaussian errors
##D 
##D      z    <- TML.noncensored(log(Cost)~log(LOS)+Adm+Ass+Age+Dst+Sex,
##D               otp="adaptive",control=list(fastS=TRUE))
##D 
##D      summary(z)
##D      
##D      # Truncated maximum likelihood regression with log-Weibull errors
##D 
##D      w    <- TML.noncensored(log(Cost)~log(LOS)+Adm+Ass+Age+Dst+Sex,
##D              errors="logWeibull",otp="adaptive",control=list(fastS=TRUE))
##D 
##D      summary(w)
## End(Not run)



