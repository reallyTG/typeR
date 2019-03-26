library(derivmkts)


### Name: asiangeomavg
### Title: Geometric average asian options
### Aliases: asiangeomavg geomavgprice geomavgpricecall geomavgpriceput
###   geomavgstrike geomavgstrikecall geomavgstrikeput

### ** Examples

s=40; k=40; v=0.30; r=0.08; tt=0.25; d=0; m=3;
geomavgpricecall(s, k, v, r, tt, d, m)
geomavgpricecall(s, 38:42, v, r, tt, d, m)
geomavgpricecall(s, 38:42, v, r, tt, d, m, cont=TRUE)




