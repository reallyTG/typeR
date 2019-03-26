library(pgirmess)


### Name: selMod
### Title: Model selection according to information theoretic methods
### Aliases: selMod selMod.lm selMod.glm selMod.list
### Keywords: models

### ** Examples

 library(MASS)
 anorex.1 <- lm(Postwt ~ Prewt*Treat, data = anorexia)
 selMod(anorex.1)
 anorex.2 <- glm(Postwt ~ Prewt*Treat, family=gaussian,data = anorexia)
 selMod(anorex.2)
 anorex.3<-lm(Postwt ~ Prewt+Treat, data = anorexia)
 mycomp<-selMod(list(anorex.1,anorex.2,anorex.3))
 mycomp
 attributes(mycomp)$models



