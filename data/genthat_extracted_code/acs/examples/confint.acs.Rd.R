library(acs)


### Name: confint.acs
### Title: Return upper and lower bounds of given confidence intervals for
###   acs objects.
### Aliases: confint.acs confint

### ** Examples


# load ACS data
data(kansas09)

# confidence intervals for select columns
confint(kansas09[20:25,], parm=c(4,5,10))

# another way to accomplish this
confint(kansas09[20:25,c(4,5,10)])

# store data and extract at will
my.conf <- confint(kansas09)
str(my.conf)
my.conf[32]
my.conf$Universe...TOTAL.POPULATION.IN.THE.UNITED.STATES..U.S..citizen.by.naturalization  

# try a different value for level
confint(kansas09[1:10,6], level=.75)

# ... or a one-sided confidence interval
confint(kansas09[1:10,6], level=.75, alternative="greater")
confint(kansas09[1:10,29], level=.75, alternative="less")
 



