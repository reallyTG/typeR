library(Actigraphy)


### Name: cat_flm_plot
### Title: Plot Functional Linear Model Analysis Results of a Categorical
###   Type
### Aliases: cat_flm_plot

### ** Examples

	data(act_29pt)
	data(clinic_29pt_ahi)
	
	colnames(act_29pt) <- sub("X", "", colnames(act_29pt))
	data <- as.matrix(act_29pt[,-1])
	ahi <- clinic_29pt_ahi
	
	ahi$ahicat <- as.factor(ifelse(ahi$AHI >= 0 & ahi$AHI <= 5, 1, 
					ifelse(ahi$AHI > 5 & ahi$AHI <= 15, 2,
					ifelse(ahi$AHI > 15 & ahi$AHI <= 30, 3,
					ifelse(ahi$AHI > 30, 4, 0)))))
	
	matchidb <- fda.matchid(data, ahi[,-2] , "factor", 
		c("normal", "mild", "moderate", "severe"))
	FDcatahi <- fda.smoothdata(matchidb)
	
	L <- nrow(data)
	lb <- c("Midnight", "6AM", "Noon", "6PM", "Midnight") 
	xat <- c(0, L/4, L/2, 3*L/4, L)
	
	geftFDcatahi <- flm_cate(FDcatahi)
	predy <- as.vector(geftFDcatahi$freg$yhatfdobj$y)
	
	xlim <- c(0, L) 
	ylim <- c(min(predy), max(predy) + 100)
	
	cat.flm.results <- cat_flm_plot(FDcatahi, matchidb, geftFDcatahi, 
		TRUE, 5, lb, xat, "AHI", 1:4, ylim, L)



