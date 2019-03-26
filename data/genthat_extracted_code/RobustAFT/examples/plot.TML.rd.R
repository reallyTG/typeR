library(RobustAFT)


### Name: plot.TML
### Title: Plot Method for "TML" objects
### Aliases: plot.TML

### ** Examples

## Not run: 
##D      data(D243)
##D      Cost <- D243$Cost                             # Cost (Swiss francs)
##D      LOS  <- D243$LOS                              # Length of stay (days)
##D      Adm  <- D243$Typadm; Adm <- (Adm==" Urg")*1   # Type of admission 
##D                                                    # (0=on notification, 1=Emergency)
##D 
##D      # Truncated maximum likelihood regression with log-Weibull errors
##D      w  <- TML.noncensored(log(Cost)~log(LOS)+Adm, errors="logWeibull", 
##D            otp="adaptive", control=list(fastS=TRUE))
##D      
##D      plot(w)
##D      plot(w, which = 1)
##D      plot(w, which = 2)
##D      plot(w, which = 3)
## End(Not run)



