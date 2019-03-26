library(ProbitSpatial)


### Name: Katrina
### Title: New Orleans business recovery in the aftermath of Hurricane
###   Katrina.
### Aliases: Katrina
### Keywords: datasets

### ** Examples

## Not run: 
##D 	data(Katrina)
##D 	attach(Katrina)
##D 	table(y1) # 300 of the 673 firms reopened during 0-3 months horizon, p.1016
##D 	table(y2) # 425 of the 673 firms reopened during 0-6 months horizon, p.1016
##D 	table(y3) # 478 of the 673 firms reopened during 0-12 months horizon, p.1016
##D 	detach(Katrina)
##D 
##D 
##D 	# replicate LeSage et al. (2011), Table 3, p.1017
##D 	require(spdep)
##D  
##D 	# (a) 0-3 months time horizon
##D 	# LeSage et al. (2011) use k=11 nearest neighbors in this case
##D 	nb <- knn2nb(knearneigh(cbind(Katrina$lat, Katrina$long), k=11))
##D 	listw <- nb2listw(nb, style="W")
##D 	W1 <- as(as_dgRMatrix_listw(listw), "CsparseMatrix")
##D 
##D 	fit1_cond <- SpatialProbitFit(y1 ~ flood_depth + log_medinc + small_size + 
##D 		large_size +low_status_customers +  high_status_customers + 
##D 		owntype_sole_proprietor + owntype_national_chain, 
##D 		W=W1, data=Katrina, DGP='SAR', method="conditional", varcov="varcov")
##D 	summary(fit1_cond)
##D 
##D 	fit1_FL <- SpatialProbitFit(y1 ~ flood_depth + log_medinc + small_size + 
##D 		large_size +low_status_customers +  high_status_customers + 
##D 		owntype_sole_proprietor + owntype_national_chain, 
##D 		W=W1, data=Katrina, DGP='SAR', method="full-lik", varcov="varcov")
##D 	summary(fit1_FL)
##D 
##D 	fit1_cond_10nn <- SpatialProbitFit(y1 ~ flood_depth+ log_medinc+ small_size+
##D 		large_size +low_status_customers +  high_status_customers + 
##D 		owntype_sole_proprietor + owntype_national_chain, 
##D 		W=W1, data=Katrina, DGP='SAR', method="conditional", varcov="varcov",
##D 		control=list(iW_CL=10))
##D 	summary(fit1_cond_10nn)
##D 
##D # (b) 0-6 months time horizon
##D # LeSage et al. (2011) use k=15 nearest neighbors
##D nb <- knn2nb(knearneigh(cbind(Katrina$lat, Katrina$long), k=15))
##D listw <- nb2listw(nb, style="W")
##D W2 <- as(as_dgRMatrix_listw(listw), "CsparseMatrix")
##D 
##D fit2_cond <- SpatialProbitFit(y2 ~ flood_depth + log_medinc + small_size + 
##D 	large_size + low_status_customers + high_status_customers + 
##D 	owntype_sole_proprietor + owntype_national_chain, 
##D 	W=W2, data=Katrina, DGP='SAR', method="full-lik", varcov="varcov")
##D summary(fit2_cond)  
##D 
##D fit2_FL <- SpatialProbitFit(y2 ~ flood_depth + log_medinc + small_size + 
##D 	large_size + low_status_customers + high_status_customers + 
##D 	owntype_sole_proprietor + owntype_national_chain, 
##D 	W=W2, data=Katrina, DGP='SAR', method="full-lik", varcov="varcov")
##D summary(fit2_FL)  
##D 
##D # (c) 0-12 months time horizon
##D # LeSage et al. (2011) use k=15 nearest neighbors as in 0-6 months
##D W3 <- W2
##D fit3_cond <- SpatialProbitFit(y3 ~ flood_depth + log_medinc + small_size + 
##D 	large_size + low_status_customers + high_status_customers + 
##D 	owntype_sole_proprietor + owntype_national_chain, 
##D 	W=W3, data=Katrina, DGP='SAR', method="conditional", varcov="varcov")
##D summary(fit3_cond)
##D 
##D fit3_FL <- SpatialProbitFit(y3 ~ flood_depth + log_medinc + small_size + 
##D 	large_size + low_status_customers + high_status_customers + 
##D 	owntype_sole_proprietor + owntype_national_chain, 
##D 	W=W3, data=Katrina, DGP='SAR', method="full-lik", varcov="varcov")
##D summary(fit3_FL)
##D 
##D # replicate LeSage et al. (2011), Table 4, p.1018
##D # SAR probit model effects estimates for the 0-3-month time horizon
##D effects(fit1_cond)  
##D 
##D # replicate LeSage et al. (2011), Table 5, p.1019
##D # SAR probit model effects estimates for the 0-6-month time horizon
##D effects(fit2_cond)
##D 
##D # replicate LeSage et al. (2011), Table 6, p.1020
##D # SAR probit model effects estimates for the 0-12-month time horizon
##D effects(fit3_cond)
## End(Not run)




