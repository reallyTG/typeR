library(accelmissing)


### Name: accel.impute
### Title: Missing Value Imputation for Accelerometer Data
### Aliases: accel.impute accel.imp accel.imputation
### Keywords: accelerometer physical activity missing count data multiple
###   imputation zero-inflated model Poisson Log-normal

### ** Examples

####################################################
# A full example from data filtering to imputation	
####################################################
data(acceldata)    # read data
ls(acceldata)      # This is a list with four matrix objects, PA, label, flag, and demo
d = acceldata

## missing rate
missing.rate(label=d$label, flag=d$flag)$total  # 32 percent

# create missing flag with 60 min criterion
flag60 = create.flag(PA=d$PA, window=60)

## missing rate with flag60
mr = missing.rate(label=d$label, flag=flag60)
mr$total  #28.1 percent

## missing proportion by days
mean(mr$table < 0.1)   # 45.8 percent

# wearing proportion over time 
wear.time.plot(PA=d$PA, label=d$label, flag=flag60)

# data filtering for valid days
valid.days.out = valid.days(PA=d$PA, label=d$label, flag=flag60, wear.hr=8)
ls(valid.days.out)   # list with three matrix objects

# data filtering for valid subjects
x1 = list(PA=d$PA, label=d$label, flag=flag60) # original
x2 = valid.days.out   # output of valid.days()
valid.sub.out = valid.subjects(data1=x1, data2=x2, valid.days=3)
length(unique(valid.sub.out$label[,1]))   # 184 persons 
ls(valid.sub.out)

## missing rate with the filtered data
missing.rate(valid.sub.out$label, valid.sub.out$flag)$total    
# 20.1 percent 

# demographic data for the filtered data
idv= unique(valid.sub.out$label[,1])
matchid = match(idv, d$demo[,1]) 
demo1 = d$demo[matchid, ]

# save the data before imputation
acceldata2 = list(PA=valid.sub.out$PA, label=valid.sub.out$label, flag=valid.sub.out$flag, 
demo=demo1)
save(acceldata2, file="acceldata2.RData")

################################
# prepare the imputation
library(mice); library(pscl)
data(acceldata2) # load prepared data in this package, or 
# load("acceldata2.RData") # to use the data you saved in previous step.
data = acceldata2

# imputation: test only 10 minutes with semiparametic method  
# accelimp = accel.impute(PA=data$PA, label=data$label, flag=data$flag, 
# demo=data$demo, time.range=c("10:51","11:00"), method="zipln.pmm", D=5) 

# imputation: test only 10 minutes with parametic method  
# accelimp = accel.impute(PA=data$PA, label=data$label, flag=data$flag, 
# demo=data$demo, time.range=c("10:51","11:00"), method="zipln")

# plot 7 days before imputation 
accel.plot.7days(PA=data$PA[1:7, ], label=data$label[1:7, ], flag=data$flag[1:7, ],
 time.range=c("09:00", "20:59"), save.plot=FALSE)

# plot 7 days after imputation
data(accelimp) # load prepared data in this package, or use the data you created above.
accel.plot.7days(PA=accelimp[[1]][1:7, ], label=data$label[1:7, ], flag=data$flag[1:7, ], 
time.range=c("09:00", "20:59"),  save.plot=FALSE)




