library(DALY)


### Name: DALY_list
### Title: Make list of 'DALY' objects
### Aliases: DALY_list print.DALY_list plot.DALY_list
### Keywords: output methods

### ** Examples

## Not run: 
##D 
##D ##= load NCC example ======================================
##D setDALYexample(1)
##D 
##D ##= calculate DALYs under different scenarios =============
##D ncc_00 <- getDALY(aw = FALSE, dr = 0)
##D ncc_03 <- getDALY(aw = FALSE, dr = 0.03)
##D ncc_13 <- getDALY(aw = TRUE,  dr = 0.03)
##D 
##D ##= store results as 'DALY_list' ==========================
##D ncc <- DALY_list(ncc_00, ncc_03, ncc_13)
##D 
##D ##= barplot of different scenarios ========================
##D par(mar = c(4, 4, 1, 1) + .5)
##D plot(ncc, names = c("DALY[0,0]", "DALY[0,0.03]", "DALY[1,0.03]"))
## End(Not run)


