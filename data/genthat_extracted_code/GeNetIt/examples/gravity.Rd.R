library(GeNetIt)


### Name: gravity
### Title: Gravity model
### Aliases: gravity

### ** Examples

library(nlme)
data(ralu.model)
str(ralu.model)

# Gravity model	
x = c("DEPTH_F", "HLI_F", "CTI_F", "cti", "ffp")
( gm <- gravity(y = "DPS", x = x, d = "DISTANCE", group = "FROM_SITE", 
                data = ralu.model, ln = FALSE) )

# Plot gravity results
 par(mfrow=c(2,3))
   for (i in 1:6) { plot(gm, type=i) } 

# log likelihood of competing models 
 x = c("DEPTH_F", "HLI_F", "CTI_F", "cti", "ffp")
 for(i in x[-1]) {
   x1 = c(x[1], x[-which(x %in% i)])  
   ll <- gravity(y = "DPS", x = x1, d = "DISTANCE", group = "FROM_SITE", 
                data = ralu.model, ln = FALSE)$log.likelihood
  cat("log likelihood for parameter set:", "(",x1,")", "=", ll, "\n")				 
 }


# Distance only (IBD) model
gravity(y = "DPS", d = "DISTANCE", group = "FROM_SITE", 
        data = ralu.model, ln = FALSE)




