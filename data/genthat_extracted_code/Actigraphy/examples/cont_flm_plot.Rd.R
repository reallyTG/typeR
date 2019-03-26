library(Actigraphy)


### Name: cont_flm_plot
### Title: Plot Functional Linear Model Analysis Results of a Continuous
###   Type
### Aliases: cont_flm_plot

### ** Examples

	data(act_29pt)
	data(clinic_29pt_ahi)
	
	colnames(act_29pt) <- sub("X", "", colnames(act_29pt)) 
	data <- as.matrix(act_29pt[,-1])
	
	matchid  <- fda.matchid(data, clinic_29pt_ahi, "contin")
	FDcont <- fda.smoothdata(matchid)
	
	L <- nrow(data)
	lb <- c("Midnight", "6AM", "Noon", "6PM", "Midnight") 
	xat <- c(0, L/4, L/2, 3*L/4, L)
	
	geftFDcont <- flm_cate(FDcont)
	predy <- as.vector(geftFDcont$freg$yhatfdobj$y)
	
	xlim <- c(0, L) 
	ylim <-  c(min(predy), max(predy) + 100)
	
	legendx <- 0
	legendy <- max(predy) - 100
	
	cont.flm.results <- cont_flm_plot(FDcont, matchid, geftFDcont, xlim, 
		ylim, TRUE, 10, lb, xat, legendx, legendy, L)



