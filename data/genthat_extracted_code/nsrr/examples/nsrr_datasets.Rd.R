library(nsrr)


### Name: nsrr_datasets
### Title: NSRR data sets
### Aliases: nsrr_datasets nsrr_dataset_files

### ** Examples

df = nsrr_datasets()
testthat::expect_is(df, "data.frame")
dataset = "shhs"
token = NULL
df = nsrr_dataset_files(dataset)
ddf = nsrr_dataset_files(dataset, path = df$full_path[1])


dataset = "shhs"
token = NULL
df = nsrr_dataset_files(dataset)
nsrr_dataset_files("wecare")



