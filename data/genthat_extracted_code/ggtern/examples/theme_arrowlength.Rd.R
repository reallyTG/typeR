library(ggtern)


### Name: theme_arrowlength
### Title: Change the Length of the Ternary Arrows
### Aliases: theme_arrowlength theme_arrowcustomlength theme_arrowsmall
###   theme_arrowshort theme_arrownormal theme_arrowdefault
###   theme_arrowlarge theme_arrowlong

### ** Examples

 #Create base plot
 plot <- ggtern(data=data.frame(x=1,y=1,z=1),aes(x,y,z)) + geom_point()

 #Pre-Specified Values
 plot + theme_arrowsmall()
 
 ## Alternatives, Uncomment lines below
 plot + theme_arrownormal()
 plot + theme_arrowlarge()
 plot + theme_arrowcustomlength(.1,.8)
 plot + theme_arrowlength(start=c(.1,.25,.4),finish=c(.9,.75,.6))



