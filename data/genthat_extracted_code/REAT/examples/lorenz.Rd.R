library(REAT)


### Name: lorenz
### Title: Lorenz curve
### Aliases: lorenz

### ** Examples

# Market concentration (example from Doersam 2004):
sales <- c(20,50,20,10)
# sales turnover of four car manufacturing companies
lorenz (sales, lcx = "percentage of companies", lcy = "percentrage of sales", 
lctitle = "Lorenz curve of sales", lcg = TRUE, lcgn = TRUE)
# plots the Lorenz curve with user-defined title and labels 
# including Gini coefficent

# Income classes (example from Doersam 2004):
income <- c(500, 1500, 2500, 4000, 7500, 15000)
# average income of 6 income classes
sizeofclass <- c(1000, 1200, 1600, 400, 200, 600)
# size of income classes
lorenz (income, weighting = sizeofclass, lcg = TRUE, lcgn = TRUE)
# plots the Lorenz curve with user-defined title and labels
# including Gini coefficent

# Regional disparities in Germany:
gdp <- c(460.69, 549.19, 124.16, 65.29, 31.59, 109.27, 263.44, 39.87, 258.53, 
645.59, 131.95, 35.03, 112.66, 56.22, 85.61, 56.81)
# GDP of german regions 2015 (in billion EUR)
lorenz (gdp, lcg = TRUE, lcgn = TRUE)
# plots the Lorenz curve with user-defined title and labels
# including Gini coefficent



