library(Actigraphy)


### Name: flm_cate
### Title: Functional Linear Model Analysis
### Aliases: flm_cate

### ** Examples

	data(act_29pt)
	data(clinic_29pt_ahi)
	
	colnames(act_29pt) <- sub("X", "", colnames(act_29pt)) 
	data <- as.matrix(act_29pt[,-1])
	
	matchid  <- fda.matchid(data, clinic_29pt_ahi, "contin")
	FDcont <- fda.smoothdata(matchid)
	
	geftFDcont <- flm_cate(FDcont)



