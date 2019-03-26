library(cgdsr)


### Name: cgdsr-setVerbose
### Title: Set verbose logging level for CGDS function calls
### Aliases: cgdsr-setVerbose setVerbose setVerbose.CGDS

### ** Examples

# Create CGDS object
mycgds = CGDS("http://www.cbioportal.org/")

getCancerStudies(mycgds)

# Activate verbose logging
setVerbose(mycgds, TRUE)

getCancerStudies(mycgds)




