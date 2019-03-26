library(woeBinning)


### Name: woe.binning.deploy
### Title: Deployment of Binning
### Aliases: woe.binning.deploy

### ** Examples

# Load German credit data and create a subset
data(germancredit)
df <- germancredit[, c('creditability', 'credit.amount', 'duration.in.month',
                  'savings.account.and.bonds', 'purpose')]

# Bin all variables of the data frame (apart from the target variable)
# with default parameter settings
binning <- woe.binning(df, 'creditability', df)
					  
# Deploy the binning solution to the data frame
# (add all binned variables and corresponding WOE variables)
df.with.binned.vars.added <- woe.binning.deploy(df, binning,
                                               add.woe.or.dum.var='woe')		
					  
# Deploy the binning solution to the data frame
# (add binned variables with IV>=0.1 and corresponding dummy variables)
df.with.binned.vars.added <- woe.binning.deploy(df, binning,
                                               min.iv.total=0.1,
                                               add.woe.or.dum.var='dum')		




