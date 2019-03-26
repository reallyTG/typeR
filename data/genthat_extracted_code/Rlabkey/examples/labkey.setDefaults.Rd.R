library(Rlabkey)


### Name: labkey.setDefaults
### Title: Set the default parameters used for all http or https requests
### Aliases: labkey.setDefaults

### ** Examples


## Example of setting and clearing an API key.
# library(Rlabkey)

labkey.setDefaults(apiKey="session|abcdef0123456789abcdef0123456789")

## Functions invoked at this point share authorization
## and session information with the browser session

labkey.setDefaults()
## or labkey.setDefaults(apiKey=NULL)

## Functions no longer share authorization and session
## information with the browser session




