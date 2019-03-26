library(numOSL)


### Name: calSGCED
### Title: SGC Equivalent dose calculation and selection
### Aliases: calSGCED calSGCED.default
### Keywords: growth curve LS-normalisation equivalent dose batch analysis

### ** Examples

 data(SARdata)
 ### (1) gSGC ED calculation:
 ### gSGCpars were obtained using function "lsNORM".
 gSGCpars <- c(137.440874251, 0.007997863, 2.462035263, -0.321536177)
 avg.error2 <- 0.1111623
 res <- calSGCED(as_analyseBIN(SARdata), gSGCpars, method="gSGC", 
                 model="gok", origin=FALSE, avgDev=avg.error2,
                 SAR.Cycle=c("N","R3"))
 print(res$sgcED)

 ### (2) SGC ED calculation (not run): 
 ### SGCpars were obtained using function "fitGrowth".
 # SGCpars <- c(183.474322547,  0.007038048,  4.254287622, -0.337734151)
 # avg.error <- 0.3156259
 # calSGCED(as_analyseBIN(SARdata), SGCpars, method="SGC", model="gok", 
 #          origin=FALSE, avgDev=avg.error, SAR.Cycle="N", outpdf="SGCED")

 ### (3) gSGC ED calculation and signal-related 
 ###     rejection criteria application (not run):
 # data(BIN)
 # res_pickBIN <-pickBINdata(BIN, LType="OSL")
 # res_analyseBIN <- analyseBINdata(res_pickBIN, nfchn=4, nlchn=30)
 # res_lsNORM <- lsNORM(res_analyseBIN$SARdata, model="gok", origin=FALSE)

 # calSGCED(res_analyseBIN, SGCpars=res_lsNORM$LMpars2[,1], 
 #         model="gok", origin=FALSE, avgDev=res_lsNORM$avg.error2,
 #         method="gSGC", SAR.Cycle=c("N","R3"), Tn.above.3BG=TRUE, 
 #         TnBG.ratio.low=4, rseTn.up=10, outpdf="foo", outfile="foo")





