library(Wats)


### Name: CountyMonthBirthRate
### Title: Monthly Growth Fertility Rates (GFR) for 12 urban Oklahoma
###   counties
### Aliases: CountyMonthBirthRate CountyMonthBirthRate2005Version
###   CountyMonthBirthRate2014Version
### Keywords: datasets

### ** Examples

library(ggplot2) 

##2005 Version (see description above)
ds2005 <- CountyMonthBirthRate2005Version
ggplot(ds2005, aes(x=Date, y=BirthRate, color=factor(Fips))) + 
geom_line() +
labs(title="County Fertility - Longitudinal") 

ggplot(ds2005, aes(x=BirthRate, color=factor(Fips))) + 
geom_density() +
labs(title="Distributions of County Fertility")

##2014 Version (see description above)
ds2014 <- CountyMonthBirthRate2014Version
ggplot(ds2014, aes(x=Date, y=BirthRate, color=factor(Fips))) + 
geom_line() +
labs(title="County Fertility - Longitudinal") 

ggplot(ds2014, aes(x=BirthRate, color=factor(Fips))) + 
geom_density() +
labs(title="Distributions of County Fertility")



