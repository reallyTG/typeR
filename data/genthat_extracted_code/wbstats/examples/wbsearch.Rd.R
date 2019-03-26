library(wbstats)


### Name: wbsearch
### Title: Search indicator information available through the World Bank
###   API
### Aliases: wbsearch

### ** Examples

wbsearch(pattern = "education")

wbsearch(pattern = "Food and Agriculture Organization", fields = "sourceOrg")

# with regular expression operators
# 'poverty' OR 'unemployment' OR 'employment'
wbsearch(pattern = "poverty|unemployment|employment")



