library(icenReg)


### Name: ic_sp
### Title: Semi-Parametric models for Interval Censored Data
### Aliases: ic_sp

### ** Examples

set.seed(1)

sim_data <- simIC_weib(n = 100, inspections = 5, inspectLength = 1)
ph_fit <- ic_sp(Surv(l, u, type = 'interval2') ~ x1 + x2, 
                data = sim_data)	
# Default fits a Cox-PH model

summary(ph_fit)		
# Regression estimates close to true 0.5 and -0.5 values


new_data <- data.frame(x1 = c(0,1), x2 = c(1, 1) )
rownames(new_data) <- c('group 1', 'group 2')
plot(ph_fit, new_data)
# plotting the estimated survival curves

po_fit <- ic_sp(Surv(l, u, type = 'interval2') ~ x1 + x2, 
                data = sim_data, model = 'po')
# fits a proportional odds model

summary(po_fit)

# Not run: how to set up multiple cores
# library(doParallel)
# myCluster <- makeCluster(2) 
# registerDoParallel(myCluster)
# fit <- ic_sp(Surv(l, u, type = 'interval2') ~ x1 + x2,
#              data = sim_data, useMCores = TRUE
#              bs_samples = 500)
# stopCluster(myCluster)





