library(scorecard)


### Name: woebin_ply
### Title: WOE Transformation
### Aliases: woebin_ply

### ** Examples

# load germancredit data
data(germancredit)

# Example I
dt = germancredit[, c("creditability", "credit.amount", "purpose")]

# binning for dt
bins = woebin(dt, y = "creditability")

# converting original value to woe
dt_woe = woebin_ply(dt, bins=bins)
str(dt_woe)

## Not run: 
##D # Example II
##D # binning for germancredit dataset
##D bins_germancredit = woebin(germancredit, y="creditability")
##D 
##D # converting the values in germancredit to woe
##D # bins is a list which generated from woebin()
##D germancredit_woe = woebin_ply(germancredit, bins_germancredit)
##D 
##D # bins is a dataframe
##D bins_df = data.table::rbindlist(bins_germancredit)
##D germancredit_woe = woebin_ply(germancredit, bins_df)
## End(Not run)




