library(Distance)


### Name: ds
### Title: Fit detection functions and calculate abundance from line or
###   point transect data
### Aliases: ds

### ** Examples


# An example from mrds, the golf tee data.
library(Distance)
data(book.tee.data)
tee.data<-book.tee.data$book.tee.dataframe[book.tee.data$book.tee.dataframe$observer==1,]
ds.model <- ds(tee.data,4)
summary(ds.model)
plot(ds.model)

## Not run: 
##D # same model, but calculating abundance
##D # need to supply the region, sample and observation tables
##D region <- book.tee.data$book.tee.region
##D samples <- book.tee.data$book.tee.samples
##D obs <- book.tee.data$book.tee.obs
##D 
##D ds.dht.model <- ds(tee.data,4,region.table=region,
##D              sample.table=samples,obs.table=obs)
##D summary(ds.dht.model)
##D 
##D # specify order 2 cosine adjustments
##D ds.model.cos2 <- ds(tee.data,4,adjustment="cos",order=2)
##D summary(ds.model.cos2)
##D 
##D # specify order 2 and 3 cosine adjustments, turning monotonicity
##D # constraints off
##D ds.model.cos23 <- ds(tee.data,4,adjustment="cos",order=c(2,3),
##D                    monotonicity=FALSE)
##D # check for non-monotonicity -- actually no problems
##D check.mono(ds.model.cos23$ddf,plot=TRUE,n.pts=100)
##D 
##D # include both a covariate and adjustment terms in the model
##D ds.model.cos2.sex <- ds(tee.data,4,adjustment="cos",order=2,
##D                         monotonicity=FALSE, formula=~as.factor(sex))
##D # check for non-monotonicity -- actually no problems
##D check.mono(ds.model.cos2.sex$ddf,plot=TRUE,n.pts=100)
##D 
##D # truncate the largest 10% of the data and fit only a hazard-rate
##D # detection function
##D ds.model.hr.trunc <- ds(tee.data,truncation="10%",key="hr",adjustment=NULL)
##D summary(ds.model.hr.trunc)
##D 
##D # compare AICs between these models:
##D AIC(ds.model)
##D AIC(ds.model.cos2)
##D AIC(ds.model.cos23)
## End(Not run)




