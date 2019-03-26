library(mets)


### Name: covarianceRecurrent
### Title: Estimation of covariance for bivariate recurrent events with
###   terminal event
### Aliases: covarianceRecurrent plot.covariace.recurrent
###   covarianceRecurrentS Bootcovariancerecurrence
###   BootcovariancerecurrenceS

### ** Examples


########################################
## getting some data to work on 
########################################
data(base1cumhaz)
data(base4cumhaz)
data(drcumhaz)
dr <- drcumhaz
base1 <- base1cumhaz
base4 <- base4cumhaz
rr <- simRecurrent(1000,base1,cumhaz2=base4,death.cumhaz=dr)
rr <- count.history(rr)
rr$strata <- 1
dtable(rr,~death+status)

covrp <- covarianceRecurrent(rr,1,2,status="status",death="death",
                        start="entry",stop="time",id="id",names.count="Count")
par(mfrow=c(1,3)) 
plot(covrp)

### with strata, each strata in matrix column, provides basis for fast Bootstrap
covrpS <- covarianceRecurrentS(rr,1,2,status="status",death="death",
        start="entry",stop="time",strata="strata",id="id",names.count="Count")




