library(PortRisk)


### Name: risk.attribution
### Title: Risk Attribution of a Portfolio
### Aliases: risk.attribution

### ** Examples

# load the data 'SnP500Returns'
data(SnP500Returns)

# consider the portfolio containing the stocks of the companies
# Apple, IBM, Intel, Microsoft
pf <- c("AAPL","IBM","INTC","MSFT")

# suppose the amount of investments in the above stocks are
# $10,000, $40,000, $20,000 & $30,000 respectively
wt <- c(10000,40000,20000,30000) # weights

# risk attribution for the portfolio 'pf' with weights 'wt'
# for the time period January 1, 2013 - January 31, 2013
risk.attribution(tickers = pf, weights = wt,
                  start = "2013-01-01", end = "2013-01-31",
                  data = SnP500Returns)

# to attach the company names corresponding to the ticker names
# load the dataset containing the company names
data(SnP500List)
risk.attribution(tickers = pf, weights = wt,
                  start = "2013-01-01", end = "2013-01-31",
                  data = SnP500Returns, CompanyList = SnP500List)



