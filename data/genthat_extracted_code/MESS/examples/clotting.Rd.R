library(MESS)


### Name: clotting
### Title: Blood clotting for 158 rats
### Aliases: clotting
### Keywords: datasets

### ** Examples


 data(clotting)
 dim(clotting)
 head(clotting)
 day0= transform(clotting, day=0, pca=PCA0)
 day4= transform(clotting, day=4, pca=PCA4)
 day.both= rbind(day0,day4)
 m1= lm(pca ~ rat + day*locality + day*sex, data=day.both)
 anova(m1)
 summary(m1)
 m2= lm(pca ~ rat + day, data=day.both)
 anova(m2)
## Log transformation suggested.
## Random effect of rat.
## maybe str(clotting) ; plot(clotting) ...




