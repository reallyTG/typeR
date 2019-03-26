library(stima)


### Name: plot.rt
### Title: Function to plot a regression trunk.
### Aliases: plot.rt
### Keywords: ~plot

### ** Examples


data(employee)
fit1<-stima(employee,2,first=3,vfold=0)

##adjust the number of decimal places used in the plot
plot(fit1,digits=1)

#categorical first split 
fit2<-stima(employee,3,first=9,vfold=0)
plot(fit2)    
#click on the plot to see the next one 
#for each category of variable "jobcat" the subtree is shown in a separate plot




