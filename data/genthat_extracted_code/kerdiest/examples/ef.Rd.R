library(kerdiest)


### Name: ef
### Title: Exceedance function estimation
### Aliases: ef
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
##D # we estimate the exceedance probability for a value of the
##D # the magnitude = 4
##D est<-ef(vec_data=mg, m_c=4, lambda=lambda)
##D plot(est$grid, est$Estimated_values, type="l", 
##D xlab="years", ylab="Probability of Exceedance")
## End(Not run)



