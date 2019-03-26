library(GCalcium)


### Name: perc_baseline
### Title: Find the percent change from baseline
### Aliases: perc_baseline

### ** Examples

### Format data frame
df.new <- format_data(GCaMP)

### Transform into percent baseline: relative to -3s to -1s before epoc
perc_baseline(Dataframe = df.new, Baseline.times = c(-3, -1))



