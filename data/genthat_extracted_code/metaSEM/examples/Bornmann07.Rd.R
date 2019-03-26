library(metaSEM)


### Name: Bornmann07
### Title: A Dataset from Bornmann et al. (2007)
### Aliases: Bornmann07
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Bornmann07)
##D 
##D #### ML estimation method
##D ## No predictor
##D summary( meta3(y=logOR, v=v, cluster=Cluster, data=Bornmann07) )
##D 
##D ## Type as a predictor
##D ## Grant: 0
##D ## Fellowship: 1
##D summary( meta3(y=logOR, v=v, x=(as.numeric(Type)-1),
##D                cluster=Cluster, data=Bornmann07) )
##D 
##D ## Centered Year as a predictor
##D summary( meta3(y=logOR, v=v, x=scale(Year, scale=FALSE),
##D                cluster=Cluster, data=Bornmann07) )
##D 
##D #### REML estimation method
##D ## No predictor
##D summary( reml3(y=logOR, v=v, cluster=Cluster, data=Bornmann07) )
##D 
##D ## Type as a predictor
##D ## Grants: 0
##D ## Fellowship: 1
##D summary( reml3(y=logOR, v=v, x=(as.numeric(Type)-1),
##D                cluster=Cluster, data=Bornmann07) )
##D 
##D ## Centered Year as a predictor
##D summary( reml3(y=logOR, v=v, x=scale(Year, scale=FALSE),
##D                cluster=Cluster, data=Bornmann07) )
##D 
##D ## Handling missing covariates with FIML
##D ## MCAR
##D ## Set seed for replication
##D set.seed(1000000)
##D 
##D ## Copy Bornmann07 to my.df
##D my.df <- Bornmann07
##D ## "Fellowship": 1; "Grant": 0
##D my.df$Type_MCAR <- ifelse(Bornmann07$Type=="Fellowship", yes=1, no=0)
##D 
##D ## Create 17 out of 66 missingness with MCAR
##D my.df$Type_MCAR[sample(1:66, 17)] <- NA
##D summary(meta3X(y=logOR, v=v, cluster=Cluster, x2=Type_MCAR, data=my.df))
##D 
##D ## MAR
##D Type_MAR <- ifelse(Bornmann07$Type=="Fellowship", yes=1, no=0)
##D 
##D ## Create 27 out of 66 missingness with MAR for cases Year<1996
##D index_MAR <- ifelse(Bornmann07$Year<1996, yes=TRUE, no=FALSE)
##D Type_MAR[index_MAR] <- NA
##D 
##D ## Include auxiliary variable
##D summary(meta3X(y=logOR, v=v, cluster=Cluster, x2=Type_MAR, av2=Year, data=my.df))
## End(Not run)



