library(Causata)


### Name: GetTransforms
### Title: GetTransforms
### Aliases: GetTransforms GetTransforms.CausataData

### ** Examples

# Create a data frame with a factor that has 5 levels.
df <- data.frame(var__AP=c("a", "a", "a",  "b", "b",  "c", "d", "e", NA))
caustaData <- CausataData(df, rep(0,nrow(df)))

# Merge the smaller levels so the factor has 3 levels.
# The remaining levels will be a, b, and Other.
caustaData <- MergeLevels(caustaData, max.levels=3)

# Get a function that will re-apply any transformations in caustaData.
transformer <- GetTransforms(caustaData)

# Now, create a new data.frame and apply the same transformation to it.  
# Any levels in the factor that are not "a", or "b" will be replaced 
# with "Other"
new.df <- data.frame(var__AP=c("a", "b", "c", "c", "c", "d", "a", NA))
transformed.df <- transformer(new.df)
transformed.df$var__AP



