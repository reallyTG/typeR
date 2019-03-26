library(compareGroups)


### Name: createTable
### Title: Table of descriptives by groups: bivariate table
### Aliases: createTable print.createTable summary.createTable
###   print.summary.createTable plot.createTable
### Keywords: misc

### ** Examples


require(compareGroups)

# load REGICOR data
data(regicor)

# compute a time-to-cardiovascular event variable
regicor$tcv <- with(regicor,Surv(tocv, as.integer(cv=='Yes')))
Hmisc::label(regicor$tcv)<-"Cardiovascular incidence"

# remove variables used to create time-to variables
regicor <- remove.vars(regicor,c("todeath","death","tocv","cv"))

# descriptives by time-to-cardiovascular event, taking 'no' category as 
# the reference in computing HRs.
res <- compareGroups(tcv ~ age + sex + smoker + sbp + histhtn + 
         chol + txchol + bmi + phyact + pcs + tcv, regicor, ref.no='no')

# build table showing HR and hiding the 'no' category
restab <- createTable(res, show.ratio = TRUE, hide.no = 'no')
restab

# prints available info table
summary(restab)


# more...

## Not run: 
##D 
##D # Adds the 'available data' column
##D update(restab, show.n=TRUE)
##D 
##D # Descriptive of the entire cohort
##D update(restab, x = update(res, ~ . ))
##D 
##D # .. changing the response variable to sex
##D # Odds Ratios (OR) are displayed instead of Hazard Ratios (HR).
##D # note that now it is possible to compute descriptives by time-to-death 
##D # or time-to-cv but not the ORs . 
##D # We set timemax to 5 years, to report the probability of death and CV at 5 years:
##D update(restab, x = update(res, sex ~ . - sex + tdeath + tcv, timemax = 5*365.25))
##D 
##D 
##D ## Combining tables:
##D 
##D # a) By rows: takes the first four variables as a group and the rest as another group:
##D rbind("First group of variables"=restab[1:4],"Second group of variables"=
##D   restab[5:length(res)])
##D 
##D # b) By columns: puts stratified tables by sex one beside the other:
##D res1<-compareGroups(year ~ . - id - sex, regicor)
##D restab1<-createTable(res1, hide.no = 'no')
##D restab2<-update(restab1, x = update(res1, subset = sex == 'Male'))
##D restab3<-update(restab1, x = update(res1, subset = sex == 'Female'))
##D cbind("ALL" = restab1, "MALES" = restab2, "FEMALES" = restab3)
##D 
## End(Not run)




