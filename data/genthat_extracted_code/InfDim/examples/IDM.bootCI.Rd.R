library(InfDim)


### Name: IDM.bootCI
### Title: Infinite dimensional model (IDM) with bootstrapping
### Aliases: IDM.bootCI

### ** Examples

#a built-in dataset fish is used. This data gives sizes of 53 female stickleback measured at the age of 17, 45, 80, and 115 days.
age=c(17,45,80,115)
P=cov(fish)

out=IDM.bootCI(data=fish,age=age,nboot=1000)

#Growth patterns (i.e. trajectories)
out$Trajectories

#Percantages of variation accounted for by each growth trajectory
out$Percent.trajectory

#figure showing first two trajectories and percentages of variations accounted for by each trajectory.
par(mfrow=c(3,1),mar=c(5,4,0.5,0.5),oma=c(0.5,0.5,0.5,0.5))
barplot(out$Percent.trajectory,ylim=c(0,105),las=1,names.arg=c("1","2","3","4"), ylab="Percentage of variation",cex.lab=1.35,cex.axis=1.25)
lines(c(0.65,0.65),c(out$Percent.trajectory2.5CI[1],out$Percent.trajectory97.5CI[1]))
lines(c(1.9,1.9),c(out$Percent.trajectory2.5CI[2],out$Percent.trajectory97.5CI[2]))
lines(c(3.15,3.15),c(out$Percent.trajectory2.5CI[3],out$Percent.trajectory97.5CI[3]))
lines(c(4.4,4.4),c(out$Percent.trajectory2.5CI[4],out$Percent.trajectory97.5CI[4]))
text(0.18,100,"a",cex=1.4)
box(which="plot")

plot(age,out$Trajectories97.5CI[,1],type="l",lty=2,ylim=c(-1,1),las=1,ylab="Trajectory value",xlab="Age (days)",cex.lab=1.35,cex.axis=1.25)
lines(age,out$Trajectories2.5CI[,1],lty=2)
lines(age,out$Trajectories[,1],lty=1)
abline(h=0,lty=1)
text(17,0.9,"b",cex=1.4)

plot(age,out$Trajectories97.5CI[,2],type="l",lty=2,ylim=c(-1,1),las=1,ylab="Trajectory value",xlab="Age (days)",cex.lab=1.35,cex.axis=1.25)
lines(age,out$Trajectories2.5CI[,2],lty=2)
lines(age,out$Trajectories[,2],lty=1)
abline(h=0,lty=1)
text(17,0.9,"c",cex=1.4)





