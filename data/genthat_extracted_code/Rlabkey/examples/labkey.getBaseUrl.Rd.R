library(Rlabkey)


### Name: labkey.getBaseUrl
### Title: Get the default baseUrl parameter used for all http or https
###   requests
### Aliases: labkey.getBaseUrl

### ** Examples

## No test: 
## Example of getting previously set baseUrl
library(Rlabkey)
labkey.setDefaults(apiKey="session|abcdef0123456789abcdef0123456789",
    baseUrl="http://labkey/")
labkey.getBaseUrl()

## End(No test)



