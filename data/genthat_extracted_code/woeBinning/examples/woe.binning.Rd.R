library(woeBinning)


### Name: woe.binning
### Title: Binning via Fine and Coarse Classing
### Aliases: woe.binning

### ** Examples

# Load German credit data and create subset
data(germancredit)
df <- germancredit[, c('creditability', 'credit.amount', 'duration.in.month',
                  'savings.account.and.bonds', 'purpose')]

# Bin a single numeric variable
binning <- woe.binning(df, 'creditability', 'duration.in.month',
                       min.perc.total=0.05, min.perc.class=0.01,
                       stop.limit=0.1, event.class='bad')

# Bin a single factor
binning <- woe.binning(df, 'creditability', 'purpose',
                       min.perc.total=0.05, min.perc.class=0, stop.limit=0.1,
                       abbrev.fact.levels=50, event.class='bad')

# Bin two variables (one numeric and one factor)
# with default parameter settings
binning <- woe.binning(df, 'creditability', c('credit.amount','purpose'))

# Bin all variables of the data frame (apart from the target variable)
# with default parameter settings
binning <- woe.binning(df, 'creditability', df)




