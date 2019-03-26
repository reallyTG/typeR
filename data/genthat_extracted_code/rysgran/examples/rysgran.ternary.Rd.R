library(rysgran)


### Name: rysgran.ternary
### Title: Generates the Ternary Diagrams of Shepard, Pejrup and Flemming
### Aliases: rysgran.ternary

### ** Examples


library(rysgran)
data(camargo2001)
data(sed.phi)

#Shepard diagram
percent <- class.percent(camargo2001, mode="total")
x<-percent[2:4] #choosing only the 'sand', 'silt' and 'clay' columns
rysgran.ternary  (x, method = "shepard")


#Pejrup diagram
percent <- class.percent(camargo2001, mode="total")
x<-percent[2:4] #choosing only the 'sand', 'silt' and 'clay' columns
rysgran.ternary  (x, method = "pejrup")

#Flemming diagram
percent <- class.percent(camargo2001, mode="total")
x<-percent[2:4] #choosing only the 'sand', 'silt' and 'clay' columns
rysgran.ternary  (x, method = "flemming")

#Shepard diagram with show.labels
percent <- class.percent(camargo2001, mode="total")
x<-percent[2:4]
rysgran.ternary (x, method="shepard", show.labels = TRUE)


#Pejrup diagram with Sorting as bubbles for different environments
#Calculating the percentage of weight in each textural class
percent <- class.percent(sed.phi, mode="total")
x<-percent[2:4]

# Calculating the grain size statistics
rys <- gran.stats(sed.phi , method="folk")
env<- as.factor(rep(c("River","Tidal Flat","Subtidal","Beach"),each=10))

# Plotting
rysgran.ternary (x, method = "pejrup",
	z = rys$Sorting, z.cex.range = c(0.5,3), 
	col = c("red","blue","black","brown")[env], pch = 19)

# Plotting the legends
legend.bubbles ("right", z=rys$Sorting , nleg=4, pch=21, col="black",
	cex=1, z.cex.range=c(0.5,3), x.intersp=1.2, y.intersp=1.2,
	digits=1, title="Sorting")

legend ("topright", c("Beach","River","Subtidal","Tidal Flat"),
	pch=15, col=c("red","blue","black","brown"))




