library(mapStats)


### Name: mapStats
### Title: Calculate and plot survey statistics
### Aliases: mapStats calcStats
### Keywords: color dplot print

### ** Examples

#More complex examples with formatting are shown in the map_examples 
#demo for the package

#create synthetic survey dataset


state_codes <- c('AL','AK','AZ','AR','CA','CO','CT','DE','DC','FL','GA','HI','ID','IL',
                 'IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE',
                 'NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD',
                 'TN','TX','UT','VT','VA','WA','WV','WI','WY')

surveydata <- data.frame(state=factor(rep(rep(state_codes, 
                         times=10), times=2)))
surveydata$year <- factor(rep(c(2009, 2010), each=nrow(surveydata)/2))
surveydata$obs_weight <- runif(n=nrow(surveydata), min=0.8, max=1.5)
surveydata$educ <- factor(sample(c("HS","BA","Grad"), replace=TRUE))

#two income distributions
surveydata$income <- 100000*rbeta(n=nrow(surveydata), 
                                  shape1=ifelse(surveydata$year==2009, 2, 1.5),
                                  shape2=ifelse(surveydata$year==2010, 10, 11))
surveydata$income_ge20k <- ifelse(surveydata$income >=20000, 100, 0)

#these state and year combinations will not be shaded if they are missing entirely
surveydata[ surveydata$state == "NV" & surveydata$year == 2009, 
            c("income","income_ge20k")] <- NA
surveydata[ surveydata$state == "OH" & surveydata$year == 2010, 
            c("income","income_ge20k")] <- NA


#load map shapefile
usMap <- readShapePoly(system.file("shapes/usMap.shp", package="mapStats")[1])


#Calculate weighted mean of variable income by state and year.  Display using red 
#sequential color palette with 4 groups.  In the titles, rename 'income'
#by 'household income'.     

mapStats(d=surveydata, var="income", d.geo.var="state", by.var="year",
         wt.var="obs_weight", map.file=usMap, stat="mean", ngroups=4, 
         paletteName="Reds", var.pretty="household income", map.label=TRUE)


#Calculate the weighted mean and 40th and 50th quantiles of the variable income
#by state, survey year, and education. Use three color palettes

## Not run: 
##D   
##D mapStats(d=surveydata, var="income", d.geo.var="state", by.var=c("year","educ"),
##D          wt.var="obs_weight", map.file=usMap, stat=c("mean","quantile"),     
##D          quantiles=c(.4, .5), ngroups=6, paletteName=c("Reds","Greens","Blues"), 
##D          var.pretty="household income", map.label=TRUE, num.col=1, num.row=2, 
##D          layout=c(2,1), cex.label=.5)
## End(Not run)

#To calculate percentages of class variables, create an indicator variable, calculate
#its mean, and override the default titles to say you are calculating the percentage.
#Here we illustrate by calculating the percent of respondents by state that have income
#above $20,000.

## Not run: 
##D mapStats(d=surveydata, var="income_ge20k", wt.var="obs_weight", 
##D          map.file=usMap, d.geo.var="state", map.geo.var="STATE_ABBR", 
##D          paletteName="Reds", stat=c("mean"), 
##D          titles="Percent of respondents with income at least $20,000")
## End(Not run)


#calculating statistics using the functions outside of mapStats

## Not run: 
##D calcStats(d=surveydata, var="income", stat="mean", 
##D           d.geo.var="state", by.var=c("year", "educ"), wt.var="obs_weight")
## End(Not run)




