library(ipeadatar)


### Name: ipeadata
### Title: Returns a database about the requested series
### Aliases: ipeadata

### ** Examples

## No test: 

# Data from
# "JPM366_EMBI366": J.P. Morgan Emerging Markets Bond Index (EMBI+), Brazil
# "SGS366_NASDAQ366": Nasdaq Composite Index - closed
data <- ipeadata(code = c("JPM366_EMBI366", "SGS366_NASDAQ366"))
# Data from
# "PRECOS12_IPCA12": Extended National Consumer Price Index (IPCA), Brazil
# in Brazilian portuguese
dataBR <- ipeadata(code = "PRECOS12_IPCA12", language = "br")
# Regional data from
# "CONSUMOTOT": Electric energy consumption, Brazil
dataReg <- ipeadata(code = "CONSUMOTOT")

## End(No test)




