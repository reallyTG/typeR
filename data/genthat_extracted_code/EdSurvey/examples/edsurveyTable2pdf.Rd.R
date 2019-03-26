library(EdSurvey)


### Name: edsurveyTable2pdf
### Title: PDF File From an edsurveyTable
### Aliases: edsurveyTable2pdf

### ** Examples

## Not run: 
##D # read in the example data (generated, not real student data)
##D sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package="NAEPprimer"))
##D 
##D # create a table with composite scores by dsex and b017451
##D est1 <- edsurveyTable(composite ~ dsex + b017451, sdf)
##D 
##D # create a table with csv output
##D edsurveyTable2pdf(data = est1, 
##D                   formula = b017451~dsex, 
##D                   toCSV = "C:/example table.csv",
##D                   filename = "C:/example table.pdf",
##D                   returnMeans = FALSE)
##D 
##D # create a pdf file using the default subject scale or subscale
##D # and keep two digits for estimates and three digits for SE after decimal point
##D edsurveyTable2pdf(est1, b017451~dsex, 
##D                   returnMeans = TRUE, estDigits = 2, seDigits = 3)
##D 
##D # create a pdf file using the percentage of students at the 
##D # aggregation level specified by \code{pctAggregationLevel}
##D # Output will be saved as "C:/example table.pdf"
##D edsurveyTable2pdf(est1, 
##D                   b017451~dsex, 
##D                   "C:/example table.pdf",
##D                   returnMeans = FALSE)
## End(Not run)



