library(flood)


### Name: RegioGEVSeas
### Title: Seasonal regional (or local) parameter and quantile estimation
### Aliases: RegioGEVSeas

### ** Examples

library("evd")
# Seasonal observations of 80 years at one station:
x1 <- rgev(80, 2, 1, 0.2) # observations from season 1
x2 <- rgev(80, 3, 1, 0.3) # observations from season 2
RegioGEVSeas(x1=x1, x2=x2, p=0.95)

# Missing values in both seasons in the same year(s):
x1a <- c(NA, x1, NA)
x2a <- c(NA, x2, NA)
RegioGEVSeas(x1a, x2a, p=0.99, leftrim=0, rightrim=0, na.rm=TRUE)

# Missing values in both seasons in different year(s):
x1b <- x1
x1b[c(4,19)] <- NA
x2b <- x2
x2b[77] <- NA
RegioGEVSeas(x1b, x2b, p=0.99, leftrim=0, rightrim=0, na.rm=TRUE)

# Seasonal observations of 100 years at 4 stations:
x1 <- matrix(rgev(400, 2, 1, 0.3), ncol=4)
x2 <- matrix(rgev(400, 4, 1, 0.2), ncol=4)
# estimate quantile for station 1 and 2 (consider the same shape-parameters):
RegioGEVSeas(x1, x2, p=0.99, j=1, leftrim=0, rightrim=0)
RegioGEVSeas(x1, x2, p=0.99, j=2, leftrim=0, rightrim=0)

# With missing values:
x3 <- x1
x4 <- x2
x3[c(54, 89, 300)] <- NA
RegioGEVSeas(x3, x4, p=0.99, j=1, leftrim=0, rightrim=0)



