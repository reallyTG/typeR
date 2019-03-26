library(s2dverification)


### Name: BrierScore
### Title: Compute Brier Score And Its Decomposition And Brier Skill Score
### Aliases: BrierScore .BrierScore
### Keywords: datagen

### ** Examples

# Minimalist examples with BrierScore
a <- runif(10)
b <- round(a)
x <- BrierScore(b, a)
x$bs - x$bs_check_res
x$bs - x$bs_check_gres
x$rel_bias_corrected - x$gres_bias_corrected + x$unc_bias_corrected
  ## Not run: 
##D a <- runif(10)
##D b <- cbind(round(a),round(a)) # matrix containing 2 identical ensemble members...
##D x2 <- BrierScore(a, b)
##D   
## End(Not run)

# Example of BrierScore using UltimateBrier
# See ?UltimateBrier for more information
example(Load)
clim <- Clim(sampleData$mod, sampleData$obs)
ano_exp <- Ano(sampleData$mod, clim$clim_exp)
ano_obs <- Ano(sampleData$obs, clim$clim_obs)
bs <- UltimateBrier(ano_exp, ano_obs, thr = c(1/3, 2/3))

  ## Not run: 
##D # Example of .BrierScore with veriApply
##D require(easyVerification)
##D BrierScore2 <- s2dverification:::.BrierScore
##D bins_ano_exp <- ProbBins(ano_exp, thr = c(1/3, 2/3), posdates = 3, posdim = 2)
##D bins_ano_obs <- ProbBins(ano_obs, thr = c(1/3, 2/3), posdates = 3, posdim = 2)
##D bs2 <- veriApply("BrierScore2", bins_ano_exp, Mean1Dim(bins_ano_obs, 3), 
##D                  tdim = 2, ensdim = 3)
##D   
## End(Not run)



