library(DMMF)


### Name: DMMF
### Title: Daily based Morgan-Morgan-Finney (DMMF) soil erosion model
### Aliases: DMMF

### ** Examples

## Not run: 
##D ## Load example data for test running DMMF model
##D data(Potato.Convex)
##D attach(Potato.Convex)
##D ## Run DMMF function using Potato.Convex data
##D Result <- DMMF(DEM = s.map$DEM, R = d.var$R, RI = d.var$RI, ET = d.var$ET, 
##D                P_c = s.var$P_c, P_z = s.var$P_z, P_s = s.var$P_s, 
##D                theta_init = d.map$theta_init, theta_sat = s.var$theta_sat, 
##D                theta_fc = s.var$theta_fc,
##D                SD = s.var$SD, K = s.var$K, P_I = s.var$P_I, n_s = s.map$n_s, 
##D                CC = d.var$CC, GC = s.var$GC, IMP = s.map$IMP, PH = d.var$PH, 
##D                D = s.var$D, NV = s.var$NV, d_a = s.var$d_a,
##D                DK_c = s.var$DK_c, DK_z = s.var$DK_z, DK_s = s.var$DK_s, 
##D                DR_c = s.var$DR_c, DR_z = s.var$DR_z, DR_s = s.var$DR_s, 
##D                Breaking = d.var$Breaking, Init_point = d.var$Init_point, 
##D                R_Type = 0, slpMode = 2, ALL = TRUE)
##D ## Check results
##D ## 1-a. Total volume of runoff generated from each element
##D plot(Result$Q_out)
##D ## 1-b. Total volume of runoff per unit surface area generated from each element
##D plot(Result$Q_out/Result$A)
##D 
##D ## 2-a. Total mass of eroded soil from each element
##D plot(Result$SL_out)
##D ## 2-a. Total mass of eroded soil per unit surface area from each element
##D plot(Result$SL_out/Result$A)
## End(Not run)



