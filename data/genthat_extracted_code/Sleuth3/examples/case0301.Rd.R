library(Sleuth3)


### Name: case0301
### Title: Cloud Seeding
### Aliases: case0301
### Keywords: datasets

### ** Examples

attach(case0301) 
str(case0301) #Seeded is level 1 of Treatment (it's first alphabetically)

boxplot(Rainfall ~ Treatment) 
boxplot(log(Rainfall) ~ Treatment) # Boxplots of natural logs of Rainfall 

t.test(log(Rainfall) ~ Treatment, var.equal=TRUE,
  alternative="greater") # 1-sided t-test; alternative: level 1 mean is greater
        

myTest <- t.test(log(Rainfall) ~ Treatment,  var.equal=TRUE,
  alternative="two.sided") # 2-sided alternative to get confidence interval
exp(myTest$est[1] - myTest$est[2])  # Back-transform estimate on log scale 
exp(myTest$conf) # Back transform endpoints of confidence interval 

boxplot(log(Rainfall) ~ Treatment, 
  ylab="Log of Rainfall Volume in Target Area (Acre Feet)", 
  names=c("On 26 Seeded Days", "On 26 Unseeded Days"), 
  main="Distributions of Rainfalls from Cloud Seeding Experiment") 

## POLISHED BOXPLOTS FOR PRESENTATION:
opar <- par(no.readonly=TRUE)  # Store device graphics parameters
par(mar=c(4,4,4,4))   # Change margins to allow more space on right
boxplot(log(Rainfall) ~ Treatment, ylab="Log Rainfall (Acre-Feet)",
  names=c("on 26 seeded days","on 26 unseeded days"), 
  main="Boxplots of Rainfall on Log Scale", col="green", boxlwd=2,
  medlwd=2, whisklty=1, whisklwd=2, staplewex=.2, staplelwd=2,
  outlwd=2, outpch=21, outbg="green", outcex=1.5      )        
myTicks <- c(1,5,10,100,500,1000,2000,3000) # some tick marks for original scale 
axis(4, at=log(myTicks), label=myTicks)   # Add original-scale axis on right    
mtext("Rainfall (Acre Feet)", side=4, line=2.5) # Add right-side axis label 
par(opar)  # Restore previous graphics parameter settings

detach(case0301) 



