### R code from vignette source 'howto.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: howto.Rnw:35-44
###################################################
library(wtss)

# create a connection using a serverUrl
server <-  wtss::WTSS("http://www.esensing.dpi.inpe.br/wtss/")

# get the list of coverages provided by the service
coverages <- wtss::listCoverages(server)
#print coverages
coverages


###################################################
### code chunk number 2: howto.Rnw:49-55
###################################################
# get the description of the MOD13Q1 coverage
cv <-  wtss::describeCoverage(server, "MOD13Q1")
# print information about the data
cv$MOD13Q1$description
# print informaton about the coverage bands
cv$MOD13Q1$attributes


###################################################
### code chunk number 3: howto.Rnw:63-69
###################################################
# get a time series for the "ndvi" attribute
time_series <- wtss::timeSeries(server, coverages = "MOD13Q1", attributes=c("ndvi", "evi"), 
                      latitude=-10.408, longitude=-53.495, 
                      start_date="2000-02-18", end_date="2016-01-01")
# plot the time series
plot (time_series$MOD13Q1$attributes)


