library(pedquant)


### Name: pq_index
### Title: creating weighted index
### Aliases: pq_index

### ** Examples

## No test: 
# Example I bank share index
# load data
bank_symbol = c('601988', '601288', '601398', '601939', '601328')
bank_dat = md_stock(bank_symbol, source='163', date_range = 'max')

# creating index
bank_index = pq_index(bank_dat, x='close', w='cap_total')
# pq_plot(bank_index)

## End(No test)




