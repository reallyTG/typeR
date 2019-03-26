library(countyfloods)


### Name: long_term_flood
### Title: Return flood metrics by county codes for a data frame input
### Aliases: long_term_flood

### ** Examples

## Not run: 
##D #Northern VA flooding every April
##D county_cd <- c(rep("51013", 5), rep("51107", 5), rep("51059", 5))
##D start_date <- rep(c("2010-04-01", "2011-04-01", "2012-04-01", "2013-04-01", "2014-04-01"), 3)
##D end_date <- rep(c("2010-04-30", "2011-04-30", "2012-04-30", "2013-04-30", "2014-04-30"), 3)
##D input_df <- data.frame(county_cd = county_cd, start_date = start_date, end_date = end_date,
##D                       stringsAsFactors = FALSE)
##D 
##D #With default values
##D VA_floods <- long_term_flood(input_df)
##D 
##D #Using NWS values
##D VA_floods <- long_term_flood(input_df, threshold = "NWS")
## End(Not run)



