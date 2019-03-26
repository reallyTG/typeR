library(cgdsr)


### Name: cgdsr-getCancerStudies
### Title: Get available cancer studies available in CGDS
### Aliases: cgdsr-getCancerStudies getCancerStudies getCancerStudies.CGDS

### ** Examples

# Create CGDS object
mycgds = CGDS("http://www.cbioportal.org/")

getCancerStudies(mycgds)

# Get available case lists (collection of samples) for a given cancer study
mycancerstudy = getCancerStudies(mycgds)[2,1]
mycaselist = getCaseLists(mycgds,mycancerstudy)[1,1]




