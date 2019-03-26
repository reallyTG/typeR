library(spatialprobit)


### Name: Katrina
### Title: New Orleans business recovery in the aftermath of Hurricane
###   Katrina
### Aliases: Katrina Katrina.raw
### Keywords: datasets

### ** Examples

data(Katrina)
attach(Katrina)
table(y1) # 300 of the 673 firms reopened during 0-3 months horizon, p.1016
table(y2) # 425 of the 673 firms reopened during 0-6 months horizon, p.1016
table(y3) # 478 of the 673 firms reopened during 0-12 months horizon, p.1016
detach(Katrina)

## Not run: 
##D # plot observations in New Orleans map
##D if (require(ggmap)) {
##D   qmplot(long, lat, data = Katrina, maptype="roadmap", source="google")
##D }
##D 
##D # replicate LeSage et al. (2011), Table 3, p.1017
##D require(spdep)
##D  
##D # (a) 0-3 months time horizon
##D # LeSage et al. (2011) use k=11 nearest neighbors in this case
##D nb <- knn2nb(knearneigh(cbind(Katrina$lat, Katrina$long), k=11))
##D listw <- nb2listw(nb, style="W")
##D W1 <- as(as_dgRMatrix_listw(listw), "CsparseMatrix")
##D 
##D fit1 <- sarprobit(y1 ~ flood_depth + log_medinc + small_size + large_size +
##D   low_status_customers +  high_status_customers + 
##D   owntype_sole_proprietor + owntype_national_chain, 
##D   W=W1, data=Katrina, ndraw=600, burn.in = 100, showProgress=TRUE)
##D summary(fit1)
##D   
##D # (b) 0-6 months time horizon
##D # LeSage et al. (2011) use k=15 nearest neighbors
##D nb <- knn2nb(knearneigh(cbind(Katrina$lat, Katrina$long), k=15))
##D listw <- nb2listw(nb, style="W")
##D W2 <- as(as_dgRMatrix_listw(listw), "CsparseMatrix")
##D 
##D fit2 <- sarprobit(y2 ~ flood_depth + log_medinc + small_size + large_size +
##D   low_status_customers + high_status_customers + 
##D   owntype_sole_proprietor + owntype_national_chain, 
##D   W=W2, data=Katrina, ndraw=600, burn.in = 100, showProgress=TRUE)
##D summary(fit2)  
##D 
##D # (c) 0-12 months time horizon
##D # LeSage et al. (2011) use k=15 nearest neighbors as in 0-6 months
##D W3 <- W2
##D fit3 <- sarprobit(y3 ~ flood_depth + log_medinc + small_size + large_size +
##D   low_status_customers + high_status_customers + 
##D   owntype_sole_proprietor + owntype_national_chain, 
##D   W=W3, data=Katrina, ndraw=600, burn.in = 100, showProgress=TRUE)
##D summary(fit3)
##D 
##D # replicate LeSage et al. (2011), Table 4, p.1018
##D # SAR probit model effects estimates for the 0-3-month time horizon
##D impacts(fit1)  
##D 
##D # replicate LeSage et al. (2011), Table 5, p.1019
##D # SAR probit model effects estimates for the 0-6-month time horizon
##D impacts(fit2)
##D 
##D # replicate LeSage et al. (2011), Table 6, p.1020
##D # SAR probit model effects estimates for the 0-12-month time horizon
##D impacts(fit3)
## End(Not run)



