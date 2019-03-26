library(highfrequency)


### Name: tqLiquidity
### Title: Calculate numerous (23) liquidity measures
### Aliases: tqLiquidity
### Keywords: liquidity

### ** Examples

#load data samples
data("sample_tdata");
data("sample_qdata");
tdata = sample_tdata;
qdata = sample_qdata;
#match the trade and quote data
tqdata = matchTradesQuotes(tdata,qdata);

#calculate the proportional realized spread:
prs = tqLiquidity(tqdata,tdata,qdata,type="prs");

#calculate the effective spread:
es = tqLiquidity(tqdata,type="es");



