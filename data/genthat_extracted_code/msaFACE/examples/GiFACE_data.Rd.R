library(msaFACE)


### Name: GiFACE
### Title: Longterm time series of a Free Air Carbon Enrichment experiment
###   (FACE)
### Aliases: GiFACE
### Keywords: datasets, GiFACE

### ** Examples

## Not run: 
##D ## Workaround to import the data from the DOI (10.5678\LCRS\DAT.265)
##D 
##D ## Load data from http://dx.doi.org/10.5678/LCRS/DAT.265 and extract csv-file
##D ## Define variable 'filename' so that it points to the csv-file
##D filename <- ""
##D 
##D ## Import data
##D import <- read.csv(filename,
##D                    stringsAsFactors = FALSE)
##D 
##D ## Delete every second column (quality flag of database)
##D data <- import[,seq(1, ncol(import), 2)]
##D 
##D ## Create a vector containing the years of data acquistion 
##D year_vec <- substr(data[,1],1,4)
##D 
##D ## Delete further unnecessary columns
##D data <- data[,-c(1,2,13)]
##D 
##D ## Perform Moving Subset Analysis for all forcing experiment support variables (default) with
##D ## independent variable CO2 Concentration (CO2), dependent variable biomass (BY_T), 30 observations
##D ## within each subset and the years as grouping factor
##D MSA_GiFACE <- moving_subset_analysis(data, "CO2", "BY_T", 30, group =  year_vec)
##D 
##D ## Show summary
##D summary(MSA_GiFACE)
## End(Not run)



