library(egor)


### Name: as_alts_df
### Title: Create global alters and alter-alter relations dataframes from
###   an 'egor' object
### Aliases: as_alts_df as_aaties_df

### ** Examples

# Load example data
data(egor32)

# Create global alters dataframes
as_alts_df(egor32)

# Create global alter-alter relaions dataframes
as_aaties_df(egor32)

# ... adding alter variables
as_aaties_df(egor32, include.alt.vars = TRUE)



