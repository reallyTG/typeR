library(trajr)


### Name: TrajsStatsReplaceNAs
### Title: Replace NAs in a data frame
### Aliases: TrajsStatsReplaceNAs

### ** Examples

df <- data.frame(x = c(1, 2, 3), y = c(NA, 5, 6), z = c(NA, NA, 9))
# Eliminate NAs in y, add a flag column, ignore other NAs
df <- TrajsStatsReplaceNAs(df, "y", flagColumn = "y.was.NA")
print(df)




