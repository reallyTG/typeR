library(woeBinning)


### Name: woe.binning.table
### Title: Tabulation of Binning
### Aliases: woe.binning.table

### ** Examples

# Load German credit data and create a subset
data(germancredit)
df <- germancredit[, c('creditability', 'credit.amount', 'duration.in.month',
                  'savings.account.and.bonds', 'purpose')]

# Bin all variables of the data frame (apart from the target variable)
# with default parameter settings
binning <- woe.binning(df, 'creditability', df)

# Tabulate the binned variables
tabulate.binning <- woe.binning.table(binning)
tabulate.binning

## Not run: 
##D 
##D # Plot a layouted table (using the gridExtra library) for a specific
##D # variable (in this example for the first binned variable
##D # with the highest IV value)
##D library(gridExtra)
##D grid.table(tabulate.binning[[1]],
##D           theme = ttheme_default(core=list(bg_params=
##D                   list(fill=c(rep(c('grey95','grey90'),
##D                   length.out=nrow(tabulate.binning[[1]])-1),
##D                   '#BCC7BD')),fg_params=list(cex=0.8)),
##D                   colhead=list(fg_params=list(cex=0.8))),
##D                   rows=NULL)
## End(Not run)




