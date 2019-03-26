library(hpiR)


### Name: hedModel
### Title: Estimate hedonic model for index creation
### Aliases: hedModel

### ** Examples


 # Load example data
 data(ex_sales)

 # Create hedonic data
 hed_data <- hedCreateTrans(trans_df = ex_sales,
                           prop_id = 'pinx',
                           trans_id = 'sale_id',
                           price = 'sale_price',
                           date = 'sale_date',
                           periodicity = 'monthly')

 # Estimate Model
 hed_model <- hedModel(estimator = structure('base', class = 'base'),
                       hed_df = hed_data,
                       hed_spec = as.formula(log(price) ~ baths + tot_sf))




