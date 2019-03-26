library(ipeadatar)


### Name: metadata
### Title: Returns a metadata about the requested series
### Aliases: metadata

### ** Examples

# Metadata about
# "JPM366_EMBI366": J.P. Morgan Emerging Markets Bond Index (EMBI+), Brazil
# "SGS366_NASDAQ366": Nasdaq Composite Index - closed
meta <- metadata(code = c("JPM366_EMBI366", "SGS366_NASDAQ366"))

# Metadata about
# "PRECOS12_IPCA12": Extended National Consumer Price Index (IPCA), Brazil
# in Brazilian portuguese
metaBR <- metadata(code = "PRECOS12_IPCA12", language = "br")

# Regional metadata about
# "CONSUMOTOT": Electric energy consumption, Brazil
metaReg <- metadata(code = "CONSUMOTOT")




