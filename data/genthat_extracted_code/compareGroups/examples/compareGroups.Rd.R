library(compareGroups)


### Name: compareGroups
### Title: Descriptives by groups
### Aliases: compareGroups print.compareGroups plot.compareGroups
###   update.compareGroups summary.compareGroups
###   print.summary.compareGroups
### Keywords: misc

### ** Examples


require(compareGroups)

# load REGICOR data
data(regicor)

# compute a time-to-cardiovascular event variable
regicor$tcv <- with(regicor, Surv(tocv, as.integer(cv=='Yes')))
Hmisc::label(regicor$tcv)<-"Cardiovascular"

# compute a time-to-overall death variable
regicor$tdeath <- with(regicor, Surv(todeath, as.integer(death=='Yes')))
Hmisc::label(regicor$tdeath) <- "Mortality"

# descriptives by sex
res <- compareGroups(sex ~ .-id-tocv-cv-todeath-death, data = regicor)
res

# summary of each variable
summary(res)

# univariate plots of all row-variables
## Not run: 
##D plot(res)
## End(Not run)

# plot of all row-variables by sex
## Not run: 
##D plot(res, bivar = TRUE)
## End(Not run)

# update changing the response: time-to-cardiovascular event.
# note that time-to-death must be removed since it is not possible 
# not compute descriptives of a 'Surv' class object by another 'Surv' class object.

## Not run: 
##D update(res, tcv ~ . + sex - tdeath - tcv)
## End(Not run)




