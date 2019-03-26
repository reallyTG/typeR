library(acs)


### Name: prompt.acs
### Title: Prompt for new values for metadata in an acs object.
### Aliases: prompt.acs prompt

### ** Examples


data(kansas07)

acs.colnames(kansas07)=prompt(kansas07, what="acs.colnames")

geography(kansas07)=prompt.acs(kansas07, what="geography")





