library(exactRankTests)


### Name: glioma
### Title: Malignant Glioma Pilot Study
### Aliases: glioma
### Keywords: datasets

### ** Examples

data(glioma)

if(require(survival, quietly = TRUE)) {

  par(mfrow=c(1,2))

  # Grade III glioma
  g3 <- glioma[glioma$Histology == "Grade3",]

  # Plot Kaplan-Meier curves
  plot(survfit(Surv(Survival, Cens) ~ Group, data=g3), 
       main="Grade III Glioma", lty=c(2,1), 
       legend.text=c("Control", "Treated"),
       legend.bty=1, ylab="Probability", 
       xlab="Survival Time in Month")

  # log-rank test
  survdiff(Surv(Survival, Cens) ~ Group, data=g3)

  # permutation test with integer valued log-rank scores
  lsc <- cscores(Surv(g3$Survival, g3$Cens), int=TRUE) 
  perm.test(lsc ~ Group, data=g3) 

  # permutation test with real valued log-rank scores
  lsc <- cscores(Surv(g3$Survival, g3$Cens), int=FALSE)
  tr <- (g3$Group == "RIT")
  T <- sum(lsc[tr])
  pperm(T, lsc, sum(tr), alternative="tw")
  pperm(T, lsc, sum(tr), alternative="tw", simulate=TRUE)

  # Grade IV glioma
  gbm <- glioma[glioma$Histology == "GBM",] 

  # Plot Kaplan-Meier curves
  plot(survfit(Surv(Survival, Cens) ~ Group, data=gbm), 
       main="Grade IV Glioma", lty=c(2,1), 
       legend.text=c("Control", "Treated"),
       legend.bty=1, legend.pos=1, ylab="Probability", 
       xlab="Survival Time in Month")
   
  # log-rank test
  survdiff(Surv(Survival, Cens) ~ Group, data=gbm)

  # permutation test with integer valued log-rank scores
  lsc <- cscores(Surv(gbm$Survival, gbm$Cens), int=TRUE)
  perm.test(lsc ~ Group, data=gbm)

  # permutation test with real valued log-rank scores 
  lsc <- cscores(Surv(gbm$Survival, gbm$Cens), int=FALSE) 
  tr <- (gbm$Group == "RIT")
  T <- sum(lsc[tr])
  pperm(T, lsc, sum(tr), alternative="tw")
  pperm(T, lsc, sum(tr), alternative="tw", simulate=TRUE)
}



