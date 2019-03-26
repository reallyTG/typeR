library(MCPAN)


### Name: binomest
### Title: Only for internal use.
### Aliases: binomest binomest.default binomest.formula binomest.table
### Keywords: internal

### ** Examples


# if data are available as counts:

nsuccess<-c(1,2,6,8)
ntrials<-c(20,20,20,20)
binomest(x=nsuccess, n=ntrials)

binomest(x=nsuccess, n=ntrials,
 names=c("Control", "A", "B", "C"))

# if data are available as data.frame
# with categorical response variable
# and factor as grouping variable 

data(liarozole)
binomest(Improved ~ Treatment, data=liarozole)
binomest(Improved ~ Treatment, data=liarozole, success="y")

# if data are available as table
# and factor as grouping variable 

data(liarozole)
tab<-table(liarozole)

binomest(tab)
binomest(tab, success="y")





