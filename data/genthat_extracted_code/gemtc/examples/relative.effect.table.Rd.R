library(gemtc)


### Name: relative.effect.table
### Title: Table of relative effects
### Aliases: relative.effect.table forest.mtc.relative.effect.table
###   print.mtc.relative.effect.table
###   as.data.frame.mtc.relative.effect.table

### ** Examples

model <- mtc.model(smoking)
# To save computation time we load the samples instead of running the model
## Not run: results <- mtc.run(model)
results <- dget(system.file("extdata/luades-smoking.samples.gz", package="gemtc"))

# Creates a forest plot of the relative effects
tbl <- relative.effect.table(results)

# Print the n*n table
print(tbl)

# Plot effect relative to treatment "C"
forest(tbl, "C")

# Write to CSV (e.g. to import to Excel, then use in a Word table)
write.csv(tbl, "smoking-effects.csv")
# Note: use write.csv2 for Western European locales



