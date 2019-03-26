library(WWGbook)


### Name: classroom
### Title: classroom data in Chapter 4
### Aliases: classroom
### Keywords: datasets

### ** Examples

attach(classroom)

#### Boxplots for Figure 4.2
classroom.first8 <- classroom[classroom$schoolid <= 8,]
par(mfrow=c(4,2))
for (i in 1:8) 
{boxplot(classroom.first8$mathgain[classroom.first8$schoolid==i] ~ classroom.first8$classid[classroom.first8$schoolid==i],ylab="Mathgain", xlab="classid" )}




