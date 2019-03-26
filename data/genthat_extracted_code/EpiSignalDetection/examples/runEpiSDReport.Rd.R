library(EpiSignalDetection)


### Name: runEpiSDReport
### Title: Run the EpiSignalDetection report (HTML markdown)
### Aliases: runEpiSDReport

### ** Examples

## No test: 
#-- Running the report as a standalone function
runEpiSDReport()    #Definition of each input parameter
                     #is done one by one through the R console
## End(No test)
#---> OR

#-- First setting the parameters to run the report for
input <- list(
disease = "Salmonellosis",
country = "Portugal",
indicator = "Reported cases",
stratification = "Confirmed cases",
unit = "Month",
daterange = c("2011-01-01", "2016-12-31"),
algo = "FarringtonFlexible",
testingperiod = 6
)

#-- Second running the report based on the EpiSignalDetection::SignalData dataset
#-- and store it in a temporary folder
runEpiSDReport(input = input)
## No test: 
#-- Running the report based on the EpiSignalDetection::SignalData dataset
#-- and store the HTML output 'test.html' in the folder 'C:/R/'
runEpiSDReport(input = input, outputfile = "C:/R/test.html")
## End(No test)
#-- Running the report based on external data
input <- list(
file = list(datapath = "C:/Users/Downloads/ECDC_surveillance_data_Pertussis.csv"),
disease = "Pertussis",
country = "Greece",
indicator = "Reported cases",
stratification = "All cases",
unit = "Month",
daterange = c("2011-12-01", "2016-12-01"),
algo = "FarringtonFlexible",
testingperiod = 3
)
## No test: 
runEpiSDReport(input = input, stratified = TRUE)
## End(No test)





