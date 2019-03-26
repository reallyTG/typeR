library(Hmisc)


### Name: dotchartpl
### Title: Enhanced Version of dotchart Function for plotly
### Aliases: dotchartpl
### Keywords: hplot

### ** Examples

## Not run: 
##D set.seed(1)
##D d <- expand.grid(major=c('Alabama', 'Alaska', 'Arkansas'),
##D                  minor=c('East', 'West'),
##D                  group=c('Female', 'Male'),
##D                  city=0:2)
##D n <- nrow(d)
##D d$num   <- round(100*runif(n))
##D d$denom <- d$num + round(100*runif(n))
##D d$x     <- d$num / d$denom
##D d$lower <- d$x - runif(n)
##D d$upper <- d$x + runif(n)
##D 
##D with(d,
##D  dotchartpl(x, major, minor, group, city, lower=lower, upper=upper,
##D             big=city==0, num=num, denom=denom, xlab='x'))
##D 
##D # Show half-width confidence intervals for Female - Male differences
##D # after subsetting the data to have only one record per
##D # state/region/group
##D d <- subset(d, city == 0)
##D with(d,
##D  dotchartpl(x, major, minor, group, num=num, denom=denom, refgroup='Male')
##D )
##D 
##D n <- 500
##D set.seed(1)
##D d <- data.frame(
##D   race         = sample(c('Asian', 'Black/AA', 'White'), n, TRUE),
##D   sex          = sample(c('Female', 'Male'), n, TRUE),
##D   treat        = sample(c('A', 'B'), n, TRUE),
##D   smoking      = sample(c('Smoker', 'Non-smoker'), n, TRUE),
##D   hypertension = sample(c('Hypertensive', 'Non-Hypertensive'), n, TRUE),
##D   region       = sample(c('North America','Europe','South America',
##D                           'Europe', 'Asia', 'Central America'), n, TRUE))
##D 
##D d <- upData(d, labels=c(race='Race', sex='Sex'))
##D 
##D dm <- addMarginal(d, region)
##D s <- summaryP(race + sex + smoking + hypertension ~
##D                 region + treat,  data=dm)
##D 
##D s$region <- ifelse(s$region == 'All', 'All Regions', as.character(s$region))
##D 
##D with(s, 
##D  dotchartpl(freq / denom, major=var, minor=val, group=treat, mult=region,
##D             big=region == 'All Regions', num=freq, denom=denom)
##D )
##D 
##D s2 <- s[- attr(s, 'rows.to.exclude1'), ]
##D with(s2, 
##D      dotchartpl(freq / denom, major=var, minor=val, group=treat, mult=region,
##D                 big=region == 'All Regions', num=freq, denom=denom)
##D )
##D # Note these plots can be created by plot.summaryP when options(grType='plotly')
## End(Not run)



