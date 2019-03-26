library(blsAPI)


### Name: blsQCEW
### Title: Request QCEW Data from the U.S. Bureau Of Labor Statistics Open
###   Data Access
### Aliases: blsQCEW
### Keywords: bls economics

### ** Examples

# These examples are taken from the sample code examples found at: 
# <https://www.bls.gov/cew/doc/access/data_access_examples.htm>

# Area Data Request

# Required parameters are:
#  * year
#  * quarter
#  * area

# Example: Request the first quarter of 2017 for the state of Michigan
MichiganData <- blsQCEW('Area', year='2017', quarter='1', area='26000')
## Not run: 
##D # Industry Data Request
##D 
##D # Required parameters are:
##D #  * industry
##D #  * quarter
##D #  * year
##D 
##D # Example: Request Construction data for the first quarter of 2017
##D Construction <- blsQCEW('Industry', year='2017', quarter='1', industry='1012')
##D 
##D # Size Data Request
##D #  * size
##D #  * year
##D 
##D # Example: Request data for the first quarter of 2017 for establishments with 
##D # 100 to 249 employees
##D SizeData <- blsQCEW('Size', year='2017', size='6')
## End(Not run)



