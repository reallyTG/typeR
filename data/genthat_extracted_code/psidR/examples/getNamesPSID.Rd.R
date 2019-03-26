library(psidR)


### Name: getNamesPSID
### Title: GetPSID variables names from various years
### Aliases: getNamesPSID

### ** Examples

# read UMich crosswalk from installed file
r = system.file(package="psidR")
cwf = openxlsx::read.xlsx(file.path(r,"psid-lists","psid.xlsx"))

# or download directly
# cwf <- read.xlsx("http://psidonline.isr.umich.edu/help/xyr/psid.xlsx")

# then get names with
getNamesPSID("ER17013", cwf, years = 2001)
getNamesPSID("ER17013", cwf, years = 2003)
getNamesPSID("ER17013", cwf, years = NULL)
getNamesPSID("ER17013", cwf, years = c(2005, 2007, 2009))



