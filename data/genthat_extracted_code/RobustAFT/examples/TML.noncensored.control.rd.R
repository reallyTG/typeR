library(RobustAFT)


### Name: TML.noncensored.control
### Title: Control Parameters for Truncated Maximum Likelihood Regression
###   Without Censored Observations
### Aliases: TML.noncensored.control

### ** Examples

     ### In the example(TML.noncensored), the control argument can be built 
     ### using this function:
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
##D      ctrol <- TML.noncensored.control(iv=1, nrep=0, gam=0.2, fastS=TRUE, nitmon=FALSE)
##D      z     <- TML.noncensored(log(Cost)~log(LOS)+Adm+Ass+Age+Dst+Sex, otp="adaptive")
##D      summary(z)
## End(Not run)



