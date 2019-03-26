library(fingertipsR)


### Name: fingertips_data
### Title: Fingertips data
### Aliases: fingertips_data

### ** Examples

## Not run: 
##D # Returns data for the two selected domains at county and unitary authority geography
##D doms <- c(1000049,1938132983)
##D fingdata <- fingertips_data(DomainID = doms)
##D 
##D # Returns data at local authority district geography (AreaTypeID = 101)
##D # for the indicator with the id 22401
##D fingdata <- fingertips_data(22401, AreaTypeID = 101)
##D 
##D # Returns same indicator with different comparisons due to indicator polarity
##D # differences between profiles on the website
##D # It is recommended to check the website to ensure consistency between your
##D # data extract here and the polarity required
##D fingdata <- fingertips_data(rep(90282,2), ProfileID = c(19,93), AreaCode = "E06000008")
##D fingdata <- fingdata[order(fingdata$TimeperiodSortable, fingdata$Sex),]
## End(Not run)



