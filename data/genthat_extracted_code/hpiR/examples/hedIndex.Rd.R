library(hpiR)


### Name: hedIndex
### Title: Create a full index object by hedonic approach
### Aliases: hedIndex

### ** Examples


 # Load data
 data(ex_sales)

 # Create index with raw transaction data
 hed_index <- hedIndex(trans_df = ex_sales,
                       periodicity = 'monthly',
                       min_date = '2010-06-01',
                       max_date = '2015-11-30',
                       adj_type = 'clip',
                       date = 'sale_date',
                       price = 'sale_price',
                       trans_id = 'sale_id',
                       prop_id = 'pinx',
                       estimator = 'robust',
                       log_dep = TRUE,
                       trim_model = TRUE,
                       max_period = 48,
                       dep_var = 'price',
                       ind_var = c('tot_sf', 'beds', 'baths'),
                       smooth = FALSE)




