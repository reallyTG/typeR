library(zooaRch)


### Name: surv.func
### Title: General survival analysis
### Aliases: surv.func
### Keywords: analysis

### ** Examples

# Example 1: Payne 1973
 data(marjRab)

# Inspect data structure  
 head(marjRab)
 
# create age-class labels: Payne 1973 uses ageclasses A-I
 Labels <-c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I')
 surv.func(SurviveData=marjRab,labels=Labels, models=1:3, ci=95, plot=TRUE, iter=1000)
 
# Example 2: Garnsey Site Bison Data (from Speth 1983)
 data(speth83)

# Inspect data structure  
 head(speth83)

# create age-class labels using the 13 age classes of Speth's (1983) scheme.
 Labels <-c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)

# Use the catastrophic and attritional mortality curves (after Stiner 1990).
 surv.func(SurviveData=speth83,labels=Labels, models=4:5, ci=95, plot=TRUE, iter=1000)
 
# Example 3: marjRab, input user-defined survivorship models.
data(marjRab)
# extract age classes from marjRab
age<-unique(marjRab$Ageclass)
age
# model survivorship using an exponential decay function 
# with parameter b: survivorship = age^(-1/b)
# surv 1: b= .95 
surv1<-c(1.00, 0.48, 0.31, 0.23, 0.18, 0.15, 0.12, 0.11, 0.09)
# surv 2: b= .35
surv2<-c(1.00, 0.13, 0.04, 0.01, 0.01, 0.005, 0.003, 0.002, 0.001)

plot(age, surv1,type='l',xlim=range(age),ylim=c(0,1))
lines(age, surv2,col='red',)

# usermods in surv.func must be a list (if not a list, then user will receive error message)
mods<-list(surv1=surv1,surv2=surv2)

surv.func(marjRab,models=NULL,usermod=mods)



