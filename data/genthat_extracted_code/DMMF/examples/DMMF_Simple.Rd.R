library(DMMF)


### Name: DMMF_Simple
### Title: Simplified Daily based Morgan-Morgan-Finney (DMMF) soil erosion
###   model for one element during a day
### Aliases: DMMF_Simple

### ** Examples

## Not run: 
##D ## Load example data for test running DMMF_Simple function
##D data(Potato.Convex)
##D attach(Potato.Convex)
##D ## Make toy dataset using summary statistics of field datasets of "Potato.Convex" data.
##D ## The width and slope of the field are set according to the slope length of the convex field 
##D ## from Arnhold et al. (2013)
##D W = 25
##D L = 25 
##D ## The slope of the field is set as the average slope angle of the field from Arnhold et al. (2013)
##D S <- pi/180 * 9
##D ## The proportion of impervious areas are estimated as the mean value of the IMP map.
##D IMP <- cellStats(s.map$IMP, stat='mean', na.rm=TRUE)
##D ## "n_s" estimated using the guide value of RFR using paraplough (10cm/m) 
##D ## and conversion equation from RFR to Manning's n from Morgan and Duzant (2008).
##D n_s <- 0.171  
##D ## Using the ridge height of the field from Arnhold et al. (2013) 
##D ## as the hydrological radius (flow depth) of the field.
##D d_a <- 0.15
##D ## We use dynamic variables of the 12th day that has enough rainfall to produce soil erosion.
##D d.var_12<- d.var[12,]
##D 
##D ## Run DMMF_Simple function
##D Output <- DMMF_Simple( W = W, L = L, S = S, R = d.var_12$R, RI = d.var_12$RI, ET = d.var_12$ET, 
##D                       P_c = s.var$P_c, P_z = s.var$P_z, P_s = s.var$P_s, 
##D                       theta_init = s.var$theta_fc, theta_sat = s.var$theta_sat, 
##D                       theta_fc = s.var$theta_fc, SD = s.var$SD, K = s.var$K, P_I = s.var$P_I, 
##D                       n_s = n_s, CC = d.var_12$CC, GC = s.var$GC, IMP = IMP, PH = d.var_12$PH, 
##D                       D = s.var$D, NV = s.var$NV, d_a = d_a, 
##D                       DK_c = s.var$DK_c, DK_z = s.var$DK_z, DK_s = s.var$DK_s, 
##D                       DR_c = s.var$DR_c, DR_z = s.var$DR_z, DR_s = s.var$DR_s, 
##D                       Q_in = 0, IF_in = 0, SL_c_in = 0, SL_z_in = 0, SL_s_in = 0, R_type = 0)
##D 
##D ## Print outputs.
##D Output
##D ## Calculate per unit surface area
##D ## Runoff per surface area of the field
##D Output$Q_out / Output$A 
##D ## Interflow per surface area of the field
##D Output$IF_out / Output$A 
##D ## Soil loss per surface area of the field
##D (Output$SL_c_out + Output$SL_z_out + Output$SL_s_out) / Output$A 
## End(Not run)



