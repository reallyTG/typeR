library(PortRisk)


### Name: access
### Title: Access Daily Stock Returns by Dates
### Aliases: access

### ** Examples

data(SnP500Returns)

# list all the ticker names in a character vector
tckk <- colnames(SnP500Returns)

# access the data corresponding to the first 3 ticker names
# for the time period January 1, 2013 - January 10, 2013
access(tickers = tckk[1:3],
        start = "2013-01-01",
        end = "2013-01-10",
        data = SnP500Returns)



