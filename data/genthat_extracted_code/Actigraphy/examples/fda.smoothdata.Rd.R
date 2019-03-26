library(Actigraphy)


### Name: fda.smoothdata
### Title: Functional Actigraphy Data Smoothing
### Aliases: fda.smoothdata

### ** Examples

	data(act_29pt)
	data(clinic_29pt_ahi)
	
	colnames(act_29pt) <- sub("X", "", colnames(act_29pt)) 
	data <- as.matrix(act_29pt[,-1])
	
	matchid  <- fda.matchid(data, clinic_29pt_ahi, "contin")
	FDcont <- fda.smoothdata(matchid)
	
	### Smooth the Results
	ts.plot(predict(FDcont$fd$fd, c(1:1440)), main="Smoothed Activity Data")



