library(survminer)


### Name: ggsurvplot_combine
### Title: Combine a List of Survfit Objects on the Same Plot
### Aliases: ggsurvplot_combine

### ** Examples

library(survival)
# Create a demo data set
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 set.seed(123)
 demo.data <- data.frame(
   os.time = colon$time,
   os.status = colon$status,
   pfs.time = sample(colon$time),
   pfs.status = colon$status,
   sex = colon$sex, rx = colon$rx, adhere = colon$adhere
 )

# Ex1: Combine null models
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 # Fit
 pfs <- survfit( Surv(pfs.time, pfs.status) ~ 1, data = demo.data)
 os <- survfit( Surv(os.time, os.status) ~ 1, data = demo.data)
 # Combine on the same plot
 fit <- list(PFS = pfs, OS = os)
 ggsurvplot_combine(fit, demo.data)

# Combine survival curves stratified by treatment assignment rx
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Fit
pfs <- survfit( Surv(pfs.time, pfs.status) ~ rx, data = demo.data)
os <- survfit( Surv(os.time, os.status) ~ rx, data = demo.data)
# Combine on the same plot
fit <- list(PFS = pfs, OS = os)
ggsurvplot_combine(fit, demo.data)




