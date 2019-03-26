library(tidyquant)


### Name: tq_index
### Title: Get all stocks in a stock index or stock exchange in 'tibble'
###   format
### Aliases: tq_index tq_exchange tq_index_options tq_exchange_options

### ** Examples

# Load libraries
library(tidyquant)

# Get the list of stock index options
tq_index_options()

# Get all stock symbols in a stock index
## Not run: 
##D tq_index("DOW")
## End(Not run)

# Get the list of stock exchange options
tq_exchange_options()

# Get all stocks in a stock exchange
## Not run: 
##D tq_exchange("NYSE")
## End(Not run)



