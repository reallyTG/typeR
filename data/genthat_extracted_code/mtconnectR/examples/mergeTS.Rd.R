library(mtconnectR)


### Name: mergeTS
### Title: Merges all the data.frames in the list into single data.frame
### Aliases: mergeTS

### ** Examples

data("example_mtc_device")
mtc_device = merge(example_mtc_device)
df_1 = mtc_device[seq(1,17,2),]
df_2 = mtc_device[seq(2,17,2),]
merged_df = mergeTS(list(df_1,df_2))



