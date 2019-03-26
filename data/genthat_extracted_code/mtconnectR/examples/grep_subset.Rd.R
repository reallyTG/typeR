library(mtconnectR)


### Name: grep_subset
### Title: Subset a data frame using regex matching on the column name and
###   also on the value
### Aliases: grep_subset

### ** Examples

 
df = data.frame(type = c("sample","event","condition","sample"),value = c("value1","value2",
                 "value3","value4"))
filtered_df = grep_subset(df,"type","sample")                



