library(isdals)


### Name: cooling
### Title: Tenderness of pork
### Aliases: cooling
### Keywords: datasets

### ** Examples

data(cooling)
hist(cooling$tunnel[cooling$ph=="low"], main="", 
     xlab="Tenderness (low pH)", col="lightgray", ylim=c(0,5), xlim=c(3,9))
hist(cooling$tunnel[cooling$ph=="high"], main="", 
     xlab="Tenderness (high pH)", col="lightgray", ylim=c(0,5), xlim=c(3,9))

hist(cooling$tunnel[cooling$ph=="low"], freq=FALSE, main="", 
     xlab="Tenderness (low pH)", col="lightgray", ylim=c(0,.5), xlim=c(3,9))
hist(cooling$tunnel[cooling$ph=="high"], freq=FALSE, main="", 
     xlab="Tenderness (high pH)", col="lightgray", ylim=c(0,.5), xlim=c(3,9))

plot(cooling$tunnel, cooling$rapid,
     xlim=c(3,9), ylim=c(3,9),
     xlab="Tenderness (tunnel)", ylab="Tenderness (rapid)")

boxplot(cooling$tunnel, cooling$rapid, names=c("Tunnel", "Rapid"),
        ylab="Tenderness score")



