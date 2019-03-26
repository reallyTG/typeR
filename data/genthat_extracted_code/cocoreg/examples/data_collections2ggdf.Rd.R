library(cocoreg)


### Name: data_collections2ggdf
### Title: Catenate a set of data collections (lists of data.frames) into a
###   single molted data.frame.
### Aliases: data_collections2ggdf

### ** Examples

df_lst <- list(df1 = iris[,2:3], df2 = iris[2:3])
data_collections2ggdf(dc1 = df_lst, dc2 = df_lst)




