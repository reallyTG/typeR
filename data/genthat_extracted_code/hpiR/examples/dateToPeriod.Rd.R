library(hpiR)


### Name: dateToPeriod
### Title: Convert dates to a relative period
### Aliases: dateToPeriod

### ** Examples


# Load data
  data(ex_sales)

# Convert to period df
  hpi_data <- dateToPeriod(trans_df = ex_sales,
                           date = 'sale_date',
                           periodicity = 'monthly')




