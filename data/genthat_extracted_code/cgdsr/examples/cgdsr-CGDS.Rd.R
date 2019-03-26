library(cgdsr)


### Name: cgdsr-CGDS
### Title: Construct a CGDS connection object
### Aliases: cgdsr-CGDS CGDS

### ** Examples

# Create CGDS object
mycgds = CGDS("http://www.cbioportal.org/")

# Test the CGDS endpoint URL using a few simple API tests
test(mycgds) 

# Get list of cancer studies at server
getCancerStudies(mycgds)



