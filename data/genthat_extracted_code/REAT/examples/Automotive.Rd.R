library(REAT)


### Name: Automotive
### Title: Automotive industry data
### Aliases: Automotive

### ** Examples

# Market concentration in automotive industry

data(Automotive)

gini(Automotive$Turnover2008, lsize=1, lc=TRUE, le.col = "black", 
lc.col = "orange", lcx = "Shares of companies", lcy = "Shares of turnover / cars", 
lctitle = "Automotive industry: market concentration", 
lcg = TRUE, lcgn = TRUE, lcg.caption = "Turnover 2008:", lcg.lab.x = 0, lcg.lab.y = 1)
# Gini coefficient and Lorenz curve for turnover 2008

gini(Automotive$Turnover2013, lsize=1, lc = TRUE, add.lc = TRUE, lc.col = "red", 
lcg = TRUE, lcgn = TRUE, lcg.caption = "Turnover 2013:", lcg.lab.x = 0, lcg.lab.y = 0.85)
# Adding Gini coefficient and Lorenz curve for turnover 2013

gini(Automotive$Quantity2014_car, lsize=1, lc = TRUE, add.lc = TRUE, lc.col = "blue", 
lcg = TRUE, lcgn = TRUE, lcg.caption = "Cars 2014:", lcg.lab.x = 0, lcg.lab.y = 0.7)
# Adding Gini coefficient and Lorenz curve for cars 2014



