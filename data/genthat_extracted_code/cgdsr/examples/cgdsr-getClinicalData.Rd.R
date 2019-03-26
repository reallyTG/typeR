library(cgdsr)


### Name: cgdsr-getClinicalData
### Title: Get clinical data for cancer study
### Aliases: cgdsr-getClinicalData getClinicalData getClinicalData.CGDS

### ** Examples

# Create CGDS object
mycgds = CGDS("http://www.cbioportal.org/")

getCancerStudies(mycgds)

# Get available case lists (collection of samples) for a given cancer study 
mycancerstudy = getCancerStudies(mycgds)[2,1]
mycaselist = getCaseLists(mycgds,mycancerstudy)[1,1]

# Get clinical data for caselist
getClinicalData(mycgds,mycaselist)




