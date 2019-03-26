library(nonparaeff)


### Name: faremalm2
### Title: Linear Programming for the Malmquist Productivity Growth Index
### Aliases: faremalm2
### Keywords: Data Envelopment Analysis

### ** Examples

malm.dat <- data.frame(id = rep(LETTERS[1:3], 3),
       time = rep(1:3, each = 3),
                       y = c(1, 2, 2, 3, 2, 8, 3, 2, 5),
                       x = c(2, 3, 7, 3, 5, 6, 8, 9, 6))

malm.re1 <- faremalm2(malm.dat, noutput = 1, id = "id", year = "time")


## Malmquist productivity growth index of OECD countries
library(pwt)       ## Use Penn World Table
my.dat <- pwt5.6    
head(my.dat)        
my.oecd.ctry <- c("AUS", "AUT", "BEL", "CAN", "CHE", "DNK", "ESP",
                    "FIN", "FRA", "GBR", "GER", "GRC", "IRL", "ISL",
                    "ITA", "JPN", "KOR", "LUX", "MEX", "NLD", "NOR",
                    "NZL", "PRT", "SWE", "TUR", "USA", "DEU")
my.dat <- my.dat[my.dat$wbcode %in% my.oecd.ctry,]
my.dat <- my.dat[my.dat$year %in% 1980:1990,]
my.dat$rgdpl <- as.numeric(my.dat$rgdpl) ## GDP per capita
my.dat$pop <- as.numeric(my.dat$pop) ## total population (1000)
my.dat$rgdpwok <- as.numeric(my.dat$rgdpwok) ## GDP per labor
my.dat$kapw <- as.numeric(my.dat$kapw)  ## Capital stock per labor
my.dat$gdp <- my.dat$rgdpl * my.dat$pop ## Total GDP of a country
my.dat$labor <- with(my.dat, gdp/rgdpwok) ## Total labor force
my.dat$capital <- with(my.dat, kapw * labor) ## Toal capital stock
oecd <- my.dat[, c("wbcode", "year", "gdp", "labor", "capital")] 
re.oecd <- faremalm2(dat = oecd, noutput = 1, id = "wbcode", year =
"year")
## productivity growth for each country
pc.c <- tapply(re.oecd$pc, re.oecd$wbcode, geometric.mean)
## a trend of productivity growth of OECD countries
pc.y <- tapply(re.oecd$pc, re.oecd$year, geometric.mean)
## efficiency change for each country
ec.c <- tapply(re.oecd$ec, re.oecd$wbcode, geometric.mean)
## a trend of efficiency change of OECD countries
ec.y <- tapply(re.oecd$ec, re.oecd$year, geometric.mean)



