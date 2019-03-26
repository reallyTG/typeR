library(epiDisplay)


### Name: kap
### Title: Kappa statistic
### Aliases: kap kap.default kap.table kap.2.raters kap.m.raters
###   kap.ByCategory
### Keywords: array

### ** Examples

## Computation of kappa from a table
class  <- c("Normal","Benign","Suspect","Cancer")
raterA <- gl(4,4, label=class)
raterB <- gl(4,1,16, label=class)
freq   <- c(50,2,0,1,2,30,4,3,0,0,20,1,1,3,4,25)
table1 <- xtabs(freq ~ raterA + raterB)
table1
kap(table1)
wt <-c(1,.5,0,0,.5,1,0,0,0,0,1,.8,0,0,.8,1)
wttable <- xtabs(wt ~ raterA + raterB)
wttable # Agreement between benign vs normal is .5, suspect vs cancer is .8
kap(table1, wttable=wttable, print.wttable=TRUE)

# The following two lines are computational possible but inappropriate
kap(table1, wttable = "w", print.wttable=TRUE)
kap(table1, wttable = "w2", print.wttable=TRUE)

## A data set from 5 raters with 3 possible categories.
category.lab <- c("yes","no","Don't know")
rater1 <- factor(c(1,1,3,1,1,1,1,2,1,1), labels=category.lab)
rater2 <- factor(c(2,1,3,1,1,2,1,2,3,1), labels=category.lab)
rater3 <- factor(c(2,3,3,1,1,2,1,2,3,1), labels=category.lab)
rater4 <- factor(c(2,3,3,1,3,2,1,2,3,3), labels=category.lab)
rater5 <- factor(c(2,3,3,3,3,2,1,3,3,3), labels=category.lab)
kap.m.raters(data.frame(rater1,rater2,rater3,rater4,rater5))

# The above is the same as
YES <- c(1,2,0,4,3,1,5,0,1,3)
NO <- c(4,0,0,0,0,4,0,4,0,0)
DONTKNOW <- c(0,3,5,1,2,0,0,1,4,2)
kap.ByCategory(data.frame(YES,NO,DONTKNOW))

# Using 'kap.m.raters' for 2 raters is inappropriate. Kappa obtained
# from this method assumes that the agreement can come from any two raters,
# which is usually not the case.
kap.m.raters(data.frame(rater1, rater2))
# 'kap.2.raters' gives correct results
kap.2.raters(rater1, rater2)

# When there are missing values,
rater3[9] <- NA; rater4[c(1,9)] <- NA
kap.m.raters(data.frame(rater1,rater2,rater3,rater4,rater5))
# standard errors and other related statistics are not available.

# Two exclusive rating categories give only one common set of results.
# The standard error is obtainable even if the numbers of raters vary
# among individual subjects being rated.
totalRaters <- c(2,2,3,4,3,4,3,5,2,4,5,3,4,4,2,2,3,2,4,5,3,4,3,3,2)
pos <- c(2,0,2,3,3,1,0,0,0,4,5,3,4,3,0,2,1,1,1,4,2,0,0,3,2)
neg <- totalRaters - pos
kap.ByCategory(data.frame(neg, pos))



