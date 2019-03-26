library(plotrix)


### Name: election
### Title: Assign party members to seats
### Aliases: election
### Keywords: misc

### ** Examples

 # The EU parliament has 751 seats, and Wikipedia currently shows this
 eu = structure(list(colour = c("#3399FF", "#F0001C", "#0054A5", "#FFD700",
 "#990000", "#909090", "#32CD32", "#40E0D0"), party = c("EPP",
 "S and D", "ECR", "ALDE", "GUE-NGL", "Non-Inscrits", "Greens-EFA",
 "EFDD"), members = c(220L, 191L, 70L, 68L, 52L, 52L, 50L, 48L
 )), .Names = c("colour", "party", "members"), row.names = c(NA,
 -8L), class = "data.frame")
 strasbourg = seats(751, 16)
 eugov = election(strasbourg, eu, party~members, colours=eu$colour)
 oldmar<-par(mar=c(2,4,4,2))
 plot(eugov$x, eugov$y, col=eugov$colour, asp=1, pch=19, ylim=c(-2,2.5),
  xlab="", ylab="", main="EU Parliament 2014", axes=FALSE)
 legend(-0.7,-0.3,eu$party,fill=eu$colour)
 par(oldmar)
 # or using ggplot2
 ## Not run: 
##D  
##D   require(ggplot2)
##D   blank = theme(axis.line=element_blank(),
##D         axis.text.x=element_blank(),
##D   axis.text.y=element_blank(),
##D   axis.ticks=element_blank(),
##D   axis.title.x=element_blank(),
##D   axis.title.y=element_blank(),
##D   panel.background=element_blank(),
##D   panel.border=element_blank(),
##D   panel.grid.major=element_blank(),
##D   panel.grid.minor=element_blank(),
##D   plot.background=element_blank())
##D   ggplot(eugov, aes(x=x,y=y,col=party)) + geom_point() + coord_fixed() + blank
##D  
## End(Not run)



