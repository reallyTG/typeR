library(PortRisk)


### Name: risk.attrib.Copula
### Title: Risk Attribution of a Portfolio with t-Copula
### Aliases: risk.attrib.Copula

### ** Examples

# load the data 'SnP500Returns'
data(SnP500Returns)

# consider the portfolio containing the stocks of the companies
# Apple, IBM, Intel, Microsoft
pf <- c("AAPL","IBM","INTC","MSFT")

# risk attribution for the portfolio 'pf' 
# for the time period January 1, 2013 - January 10, 2013
st<-"2013-01-01"
ed<-"2013-10-10"
risk.attrib.Copula(tickers = pf, data = SnP500Returns,
                    start = st, end = ed,
                    sim.size=1000, df=10)



