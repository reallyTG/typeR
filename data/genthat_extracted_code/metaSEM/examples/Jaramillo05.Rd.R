library(metaSEM)


### Name: Jaramillo05
### Title: Dataset from Jaramillo, Mulki & Marshall (2005)
### Aliases: Jaramillo05
### Keywords: datasets

### ** Examples

## Not run: 
##D ## Research question 4.4.1
##D summary(meta(r, r_v, data=Jaramillo05))
##D 
##D ## Research question 4.4.2
##D ## Select cases with either "sales" or "nonsales"
##D Sales.df <- subset(Jaramillo05, Sales %in% c("sales", "nonsales"))
##D 
##D ## Create a predictor with 1 and 0 when they are "sales" or "nonsales", respectively
##D predictor <- ifelse(Jaramillo05$Sales=="sales", yes=1, no=0)
##D 
##D ## Mixed-effects meta-analysis
##D summary( meta(y = r, v = r_v, x = predictor, data = Jaramillo05) )
##D 
##D ## Research question 4.4.3
##D summary(meta(r, r_v, x=IDV, data=Jaramillo05))
## End(Not run)



