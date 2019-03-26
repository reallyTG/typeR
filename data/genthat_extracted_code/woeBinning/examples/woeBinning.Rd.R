library(woeBinning)


### Name: woeBinning
### Title: Package for Supervised Weight of Evidence Binning
### Aliases: woeBinning

### ** Examples

# Load German credit data and create subset
data(germancredit)
df <- germancredit[, c('creditability', 'credit.amount', 'duration.in.month',
                  'savings.account.and.bonds', 'purpose')]

# Bin all variables of the data frame (apart from the target variable)
# with default parameter settings
binning <- woe.binning(df, 'creditability', df)

# Plot the binned variables
woe.binning.plot(binning)

# Tabulate the binned variables
tabulate.binning <- woe.binning.table(binning)
tabulate.binning
						  
# Deploy the binning solution to the data frame
# (i.e. add binned variables and corresponding WOE variables)
df.with.binned.vars.added <- woe.binning.deploy(df, binning,
                                               add.woe.or.dum.var='woe')		




