library(EpiReport)


### Name: getAER
### Title: Get full disease-specific epidemiological report
### Aliases: getAER

### ** Examples

# --- Generating the AER report using the default Salmonellosis dataset
getAER()
## No test: 
# --- Or using external data (example below)
ZIKV2016 <- read.table("data/ZIKV2016.csv", sep = ",", header = TRUE, stringsAsFactors = FALSE)
output <- "C:/EpiReport/doc/"
pathMap <- "C:/EpiReport/maps/"
getAER(disease = "ZIKV", year = 2016, x = ZIKV2016, outputPath = output, pathPNG = pathMap)
## End(No test)





