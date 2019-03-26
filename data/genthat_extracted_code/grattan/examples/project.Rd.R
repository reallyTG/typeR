library(grattan)


### Name: project
### Title: A function for simple projections of tables of Australian
###   Taxation Office tax returns.
### Aliases: project

### ** Examples

# install.packages('taxstats', repos = 'https://hughparsonage.github.io/drat')
if (requireNamespace("taxstats", quietly = TRUE) &&
    requireNamespace("data.table", quietly = TRUE)) {
  library(taxstats)
  library(data.table)
  sample_file <- copy(sample_file_1314)
  sample_file_1617 <- project(sample_file,
                              h = 3L, # to "2016-17"
                              fy.year.of.sample.file = "2013-14")  
}



