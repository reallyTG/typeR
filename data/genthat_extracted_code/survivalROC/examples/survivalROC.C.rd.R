library(survivalROC)


### Name: survivalROC.C
### Title: Time-dependent ROC curve estimation from censored survival data
### Aliases: survivalROC.C
### Keywords: survival

### ** Examples

data(mayo)

nobs <- NROW(mayo)
cutoff <- 365
Staltscore4 <- NULL
Mayo.fit4 <- survivalROC.C( Stime = mayo$time,  
      status = mayo$censor,      
      marker = mayo$mayoscore4,     
      predict.time = cutoff,      
      span = 0.25*nobs^(-0.20))
Staltscore4 <- Mayo.fit4$Survival
plot(Mayo.fit4$FP, Mayo.fit4$TP, type = "l",
xlim = c(0,1), ylim = c(0,1),
xlab = paste( "FP \n AUC =",round(Mayo.fit4$AUC,3)),
ylab = "TP",main = "Year = 1" )
abline(0,1)



