library(gap)


### Name: l51
### Title: An example pedigree data
### Aliases: l51
### Keywords: datasets

### ** Examples
## Not run: 
##D km <- kin.morgan(l51)
##D k2 <- km$kin.matrix*2
##D 
##D # quantitative trait
##D library(regress)
##D r <- regress(qt ~ 1, ~k2, data=l51)
##D names(r)
##D r
##D # qualitative trait
##D N <- dim(l51)[1]
##D w <- with(l51,quantile(qt,probs=0.75,na.rm=TRUE))
##D ped51 <- within(l51, bt <- ifelse(qt<=w,0,1))
##D d <- regress(bt ~ 1, ~k2, data=ped51)
##D d
##D # for other tests not shown here
##D set.seed(12345)
##D ped51 <- within(ped51,{r <- rnorm(N); bt[is.na(bt)] <- 0})
##D library(foreign)
##D write.dta(ped51,"ped51.dta")
## End(Not run)



