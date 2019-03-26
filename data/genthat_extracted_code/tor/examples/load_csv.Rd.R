library(tor)


### Name: load_csv
### Title: Load each element of a list into an environment.
### Aliases: load_csv load_tsv load_rds load_rdata

### ** Examples

(path_csv <- tor_example("csv"))
dir(path_csv)

load_csv(path_csv)
# Each dataframe is now available in the global environment
csv1
csv2

(path_mixed <- tor_example("mixed"))
dir(path_mixed)

load_rdata(path_mixed)
# Each dataframe is now available in the global environment
lower_rdata
upper_rdata



