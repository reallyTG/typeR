library(rysgran)


### Name: legend.bubbles
### Title: Add Legends to Bubble Plots
### Aliases: legend.bubbles

### ** Examples


#Shepard diagram with Sorting as bubbles
#Calculating the percentage of weight in each textural class
library(rysgran)
data(camargo2001)

percent <- class.percent(camargo2001, mode="total")

#Calculating the grain size statistics

rys <- gran.stats(camargo2001 , method="folk")

#Plotting

rysgran.ternary (x = percent[2:4], method = "shepard",
  z = rys$Sorting, z.cex.range = c(0.5,4), col = "blue", pch = 20)

legend.bubbles ("topright", z=rys$Sorting , nleg=4, pch=20, col="blue",cex=1, 
  z.cex.range=c(0.5,4), x.intersp=1.2, y.intersp=1.2,digits=1, title="Sorting")


#Bivariated Plot
#Mean and Sorting with Kurtosis as bubbles
library(rysgran)
data(camargo2001)

#Calculating the grain size statistics

rys <- gran.stats(camargo2001 , method="folk")

#Ploting

rysgran.plot ("mean" , "sort" , data=camargo2001, method="folk", pch = 21,
  col = "red", z=rys$Kurtosis, z.cex.range=c(1,5),bg="red")

legend.bubbles ("bottomright", z=rys$Kurtosis , nleg=3, pch=21, col="black", 
  z.cex.range=c(1,5), x.intersp=1.3, y.intersp=1.6, digits=1, title="Kurtosis")




