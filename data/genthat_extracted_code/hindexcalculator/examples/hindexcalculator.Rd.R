library(hindexcalculator)


### Name: hindexcalculator
### Title: H-Index Calculator using Data from a Web of Science (WoS)
###   Citation Report
### Aliases: hindexcalculator

### ** Examples

#calculate the h(10) of the Brigham and Women's Hospital - Department of Anesthesia
 data(BWHCitationReport)
 readcsv <- BWHCitationReport
 hx <- 10
 date <- 2015

 hindexcalculator(readcsv, hx, date)



