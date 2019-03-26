library(archiDART)


### Name: trajectory
### Title: Computing Root Growth Directions and Trajectories
### Aliases: trajectory

### ** Examples

## Locate folder with DART and RSML files
path <- system.file("extdata", package="archiDART")

##---------------------
## DART and RSML files
##---------------------

res4 <- trajectory(inputrac=path, inputlie=path, inputtps=path, inputrsml=path, res=75, 
unitlength="cm", rsml.date="age", l.brangle=1, l.curv=1, l.tipangle=0.5, vertical3d="y")

## Distribution of the calculated branching angles
hist(res4$root$ch7$Branching.Angle, breaks=seq(from=0, to=180, by=5),
main="ch7-Branching angle distribution", xlab="Branching angle (d)", las=1,
xaxp=c(0,150,15), xlim=c(0,150))

## Evolution of the root tip angle for the primary root (black) and the two longest lateral roots
## (green and red)
date<-c(1:31)
plot(date, res4$tip$ch7[1,2:ncol(res4$tip$ch7)], type="l", lwd=2, bty="l",
las=1, ylim=c(0,90), ylab="ch7 - Root tip angle (d)", xlab="Time (Num)", col="black",
main="Root tip angle", yaxp=c(0,90,9))
lines(date, res4$tip$ch7[206,2:ncol(res4$tip$ch7)], lwd=2, col="green")
lines(date, res4$tip$ch7[221,2:ncol(res4$tip$ch7)], lwd=2, col="red")

## Branching angles of lateral roots
monocot<-res4$root$'monocot-archisimple'
data<-data.frame(Factor=c(rep("Monocot", nrow(monocot))), monocot)
boxplot(Branching.Angle[Ord==2]~Factor[Ord==2], data=data, ylab="Branching angle (d)",
ylim=c(45,70), main="Branching angle laterals - Monocot", las=1, outline=FALSE,
range=0, notch=TRUE)

## Evolution of the root tip angle for the first-order roots of the monocot root system
tip<-res4$tip$'monocot-archisimple'
root<-res4$root$'monocot-archisimple'
date<-c(1:(ncol(tip)-1))
firstorderroots<-which(root$Ord==1)
colors<-colorRampPalette(c("red", "green"))(length(firstorderroots))

plot(date, tip[1,2:ncol(tip)], type="n", lwd=2, bty="l", las=1, ylim=c(0,90),
yaxp=c(0,90,9), xaxp=c(0,16,16), ylab="Root tip angle (d)", xlab="Time (Num)", col="black",
main="Monocot - Root tip angle first-order roots")

for (i in 1:length(firstorderroots)){lines(date, tip[firstorderroots[i], 2:ncol(tip)], lwd=2,
col=colors[i])}



