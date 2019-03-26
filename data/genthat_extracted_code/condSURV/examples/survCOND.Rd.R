library(condSURV)


### Name: survCOND
### Title: Conditional survival probabilities based on the Kaplan-Meier
###   weights, Landmark approaches and Inverse probability of censoring
###   weighted.
### Aliases: survCOND

### ** Examples


   fit <- survCOND(survCS(time1, event1, Stime, event) ~ 1, x = 365, y = 730,
   data = colonCS, method = "KMW", conf = FALSE)

   fit1 <- survCOND(survCS(time1, event1, Stime, event) ~ 1, x = 365,
   data = colonCS, method = "LDM", conf = FALSE)

   fit2 <- survCOND(survCS(time1, event1, Stime, event) ~ 1, x = 365,
   data = colonCS, method = "LDM", lower.tail = TRUE, conf = FALSE)

   fit3 <- survCOND(survCS(time1, event1, Stime, event) ~ 1, x = 365,
   y = c(730, 1095, 1460), data = colonCS, method = "LDM", presmooth = TRUE,
   lower.tail = TRUE, conf = TRUE, n.boot = 100, conf.level = 0.95,
   cluster = FALSE)

   fit4 <- survCOND(survCS(time1, event1, Stime, event) ~ rx, x = 365,
   data = colonCS, method = "LDM", conf = FALSE)

   fit5 <- survCOND(survCS(time1, event1, Stime, event) ~ factor(sex),
   x = 365, data = colonCS, method = "LDM", conf = FALSE)

  ## Not run: 
##D    fit6 <- survCOND(survCS(time1, event1, Stime, event) ~ age,
##D    x = 365, y = 730, z.value = 48, data = colonCS, conf = TRUE)
##D    
## End(Not run)




 


