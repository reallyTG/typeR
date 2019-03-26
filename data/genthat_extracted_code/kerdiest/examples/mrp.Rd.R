library(kerdiest)


### Name: mrp
### Title: Mean return period estimation
### Aliases: mrp
### Keywords: smooth nonparametric

### ** Examples

# Working with earthquake data. We use the catalogue of the National
# Geographic Institute (IGN) of Spain and select the data of the Northwest
# of the Iberian Peninsula.
data(nwip)
require(chron)
require(date)
# we consider the data with magnitude greater than 3
mg<-nwip$magnitude[nwip$magnitude>3.0]
x1<-nwip$year
x2<-nwip$month
x3<-nwip$day
ys<-paste(x1,x2,x3)
earthquake_date<-as.character(ys)
y1s<-as.date(earthquake_date, order = "ymd")
# we compute the total number of years
y2s<-as.POSIXct(y1s)
z<-years(y2s)
n.years<-length(levels(z))
# the mean rate of earthquakes per year
lambda<-length(mg)/n.years
  ## Not run: 
##D # we estimate the mean return period (in years) between earthquakes of 
##D # the same magnitude
##D est2<-mrp(vec_data=mg, lambda=lambda)
##D plot(est2$grid, est2$Estimated_values, type="l", 
##D xlab="magnitude", ylab="Mean return period (years)")
##D  
## End(Not run)
##  Working with hydrological data: annual peak instantaneous flow of the
# Salt River near Roosevelt, AZ, USA, for 1924 - 2006.
data(saltriver)
peak<-saltriver$peakflow
## Not run: 
##D year<-saltriver$year
##D plot(year,peak, type="l",ylab="Annual peak flow")
##D  
## End(Not run)
 #  mean return period for the Saltriver data 
rp<-mrp(type_kernel="n", vec_data=peak, lambda=1)
 ## Not run: 
##D plot(rp$grid, rp$Estimated_values, type="l",
##D xlab="Flow level", ylab="Years ", main="Mean return period")
## End(Not run)



