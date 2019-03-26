library(PBImisc)


### Name: flu
### Title: Numbers of flu occurences in the 10 years period in the Poland.
### Aliases: flu
### Keywords: flu

### ** Examples

data(flu)
library(ggplot2)
subflu = flu[flu$region=="Mazowieckie", ]
# linear scale
qplot(date, inception.rate,data=subflu, geom="line")+scale_y_sqrt() +theme_bw()

# polar coordinates
qplot(1 + date.id*12/38, inception.rate,data=subflu, geom="path", xlab="month")+
        scale_y_sqrt()+geom_smooth(span=0.1,se=FALSE, size=2,col="red") + 
        coord_polar() +theme_bw()



