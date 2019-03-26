library(GCalcium)


### Name: centered_AUC
### Title: Compute centered area under curve
### Aliases: centered_AUC

### ** Examples

# Get AUCs for trial 2, centered at the mean
df.new <- format_data(data = GCaMP)
centered_AUC(Dataframe = df.new, Trial = 2, FUN = mean)



