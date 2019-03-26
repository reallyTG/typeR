library(tempdisagg)


### Name: ta
### Title: Temporal Aggregation of Time Series
### Aliases: ta ta.ts
### Keywords: models ts,

### ** Examples

data(swisspharma)
  
sales.q.a <- ta(sales.q, conversion = "sum", to = "annual")
all.equal(sales.a, sales.q.a)




