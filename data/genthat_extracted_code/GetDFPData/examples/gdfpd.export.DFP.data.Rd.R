library(GetDFPData)


### Name: gdfpd.export.DFP.data
### Title: Export tibble to an excel or csv (zipped) file
### Aliases: gdfpd.export.DFP.data

### ** Examples


# get example data from RData file
my.f <- system.file('extdata/Example_DFP_Report_Petrobras.RData', package = 'GetDFPData')
load(my.f)

## Not run: 
##D  # dontrun: keep cran check time short
##D gdfpd.export.DFP.data(df.reports, base.file.name = 'MyExcelFile', format.data = 'wide')
## End(Not run)



