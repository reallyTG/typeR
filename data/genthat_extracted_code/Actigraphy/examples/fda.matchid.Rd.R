library(Actigraphy)


### Name: fda.matchid
### Title: Match IDs from Clinical and Actigraph Data
### Aliases: fda.matchid

### ** Examples

	data(act_29pt)
	data(clinic_29pt_ahi)
	
	colnames(act_29pt) <- sub("X", "", colnames(act_29pt)) 
	data <- as.matrix(act_29pt[,-1])
	
	### Example 1: Continuous Covariate
	matchida  <- fda.matchid(data, clinic_29pt_ahi, "contin")
	
	
	### Example 2: Categorical Covariate
	ahi <- clinic_29pt_ahi
	
	ahi$ahicat <- as.factor(ifelse(ahi$AHI >= 0 & ahi$AHI <= 5, 1, 
	       ifelse(ahi$AHI > 5 & ahi$AHI <= 15, 2,
	       ifelse(ahi$AHI > 15 & ahi$AHI <= 30, 3,
	       ifelse(ahi$AHI > 30, 4, 0)))))
	
	matchidb  <- fda.matchid(data, ahi[,-2], "factor", 
		c("normal", "mild", "moderate", "severe"))



