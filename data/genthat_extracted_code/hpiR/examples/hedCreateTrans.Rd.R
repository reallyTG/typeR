library(hpiR)


### Name: hedCreateTrans
### Title: Create data for 'hed' approach
### Aliases: hedCreateTrans

### ** Examples


 # Load example data
 data(ex_sales)

 # Create Hed Data
 ex_heddata <- hedCreateTrans(trans_df = ex_sales,
                              prop_id = 'pinx',
                              trans_id = 'sale_id',
                              price = 'sale_price',
                              date = 'sale_date',
                              periodicity = 'monthly')




