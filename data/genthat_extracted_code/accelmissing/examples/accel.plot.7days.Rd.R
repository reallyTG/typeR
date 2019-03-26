library(accelmissing)


### Name: accel.plot.7days
### Title: Daily Activity Plot
### Aliases: accel.plot.7days
### Keywords: accelerometer accelmissing

### ** Examples

data(acceldata2) ; data=acceldata2 # read data before imputation	
data(accelimp) # read data after imputation
	
# plot 7 days before imputation 
accel.plot.7days(PA=data$PA[1:7, ], label=data$label[1:7, ], flag=data$flag[1:7, ],
 time.range=c("09:00", "20:59"), save.plot=FALSE)

# plot 7 days after imputation
accel.plot.7days(PA=accelimp[[1]][1:7, ], label=data$label[1:7, ], flag=data$flag[1:7, ], 
time.range=c("09:00", "20:59"), save.plot=FALSE)
	
# save the plot
# setwd("yourfolder")  #--- set the directory to save plot when save.plot=TRUE
# accel.plot.7days(PA=accelimp[[1]], label=data$label, flag=data$flag, 
# time.range=c("09:00", "20:59"),  save.plot=TRUE)



