## ------------------------------------------------------------------------
library("rqdatatable")

n <- 100000
set.seed(325235)
d <- data.frame(
  x = sample(letters, n, replace = TRUE),
  y = sample(letters, n, replace = TRUE),
  z = sample(letters, n, replace = TRUE),
  id = seq_len(n),
  stringsAsFactors = FALSE)

grouping_vars <- qc(x, y, z)

sample_ops <- local_td(d) %.>%
  extend_nse(., one := 1) %.>%
  extend_nse(., ord := runif(sum(one))) %.>%
  pick_top_k(., 
             k = 5,
             partitionby = grouping_vars,
             orderby = "ord")

samp <- ex_data_table(sample_ops)
head(samp)

## ------------------------------------------------------------------------
sample_ops <- local_td(d) %.>%
  extend_nse(., ord := random()) %.>%
  pick_top_k(., 
             k = 5,
             partitionby = grouping_vars,
             orderby = "ord")

samp <- ex_data_table(sample_ops)
head(samp)

## ------------------------------------------------------------------------
str(rqdatatable:::data_table_extend_fns)

