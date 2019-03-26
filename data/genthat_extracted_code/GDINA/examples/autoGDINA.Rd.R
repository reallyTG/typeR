library(GDINA)


### Name: autoGDINA
### Title: Q-matrix validation, model selection and calibration in one run
### Aliases: autoGDINA summary.autoGDINA

### ** Examples

## Not run: 
##D # simulated responses
##D Q <- sim10GDINA$simQ
##D dat <- sim10GDINA$simdat
##D 
##D #misspecified Q
##D misQ <- Q
##D misQ[10,] <- c(0,1,0)
##D out1 <- autoGDINA(dat,misQ,modelselectionrule="largestp")
##D out1
##D summary(out1)
##D AIC(out1$CDM.obj)
##D 
##D # simulated responses
##D Q <- sim30GDINA$simQ
##D dat <- sim30GDINA$simdat
##D 
##D #misspecified Q
##D misQ <- Q
##D misQ[1,] <- c(1,1,0,1,0)
##D auto <- autoGDINA(dat,misQ,Qvalid = TRUE, Qvalid.args = list(method = "wald"),
##D                   modelselectionrule="simpler")
##D auto
##D summary(auto)
##D AIC(auto$CDM.obj)
##D 
##D #using the other selection rule
##D out11 <- autoGDINA(dat,misQ,modelselectionrule="simpler",
##D                    modelselection.args = list(models = c("DINO","DINA")))
##D out11
##D summary(out11)
##D 
##D # disable model selection function
##D out12 <- autoGDINA(dat,misQ,modelselection=FALSE)
##D out12
##D summary(out12)
##D 
##D 
##D # Disable Q-matrix validation
##D out3 <- autoGDINA(dat = dat, Q = misQ, Qvalid = FALSE)
##D out3
##D summary(out3)
## End(Not run)



