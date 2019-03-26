library(naniar)


### Name: riskfactors
### Title: The Behavioral Risk Factor Surveillance System (BRFSS) Survey
###   Data, 2009.
### Aliases: riskfactors
### Keywords: datasets

### ** Examples


# explore the missingness with vis_miss
library(naniar)

vis_miss(riskfactors)

# Look at the missingness in the variables
miss_var_summary(riskfactors)

# and now as a plot
gg_miss_var(riskfactors)

# Look at the missingness in bmi and poor health
library(ggplot2)
p <-
ggplot(riskfactors,
       aes(x = health_poor,
           y = bmi)) +
     geom_miss_point()

 p

 # for each sex?
 p + facet_wrap(~sex)
 # for each education bracket?
 p + facet_wrap(~education)




