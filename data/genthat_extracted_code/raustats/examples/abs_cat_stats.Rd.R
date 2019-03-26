library(raustats)


### Name: abs_cat_stats
### Title: Get ABS catalogue series data
### Aliases: abs_cat_stats

### ** Examples

  ## No test: 
    ## Download quarterly Australian National Accounts, Tables 1 & 2 
    ana_q <- abs_cat_stats("5206.0", tables=c("Table 1\\W+", "Table 2\\W+"));

    ## Download December 2017 Australian National Accounts, Table 1
    ana_q_2017q4 <- abs_cat_stats("5206.0", tables="Table 1\\W+", release="Dec 2017");
  
## End(No test)



