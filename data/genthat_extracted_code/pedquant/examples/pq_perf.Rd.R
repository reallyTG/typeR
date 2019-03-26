library(pedquant)


### Name: pq_perf
### Title: creating performance trends
### Aliases: pq_perf

### ** Examples

 
## No test: 
# load data
dat = md_stock(c('000001', '^000001'), date_range = 'max', source = '163')

# create performance trends
perf = pq_perf(dat)
# pq_plot(perf)

## End(No test)




