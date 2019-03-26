library(kyotil)


### Name: plotting
### Title: Plotting Functions
### Aliases: abline.pt.slope wtd.hist abline.pts abline.shade
###   abline.shade.2 butterfly.plot empty.plot getMfrow myforestplot
###   my.interaction.plot myboxplot myboxplot.formula myboxplot.data.frame
###   myboxplot.list mylegend mymatplot mypairs myhist mypdf mypng
###   mypostscript panel.cor panel.hist panel.nothing corplot
###   corplot.default corplot.formula VEplot.glm add.mtext.label mydev.off
###   myfigure mytiff

### ** Examples

myfigure(mfrow=c(1,2))
    plot(1:10)
    plot(1:10)
mydev.off(ext="png,pdf", file="tmp")

set.seed(1)
x=1:50+rnorm(50,0,4)
y=1:50+rnorm(50,0,4)
dat=data.frame(x, y)
corplot(y~x,dat,add.lm.fit=TRUE,add.deming.fit=TRUE,col.lm="red",col.deming="blue")




