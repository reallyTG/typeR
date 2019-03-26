library(OPDOE)


### Name: triangular.test.prop
### Title: Triangular Test for Bernoulli Data
### Aliases: triangular.test.prop
### Keywords: test

### ** Examples

data(heights)
attach(heights)
male180 <- as.integer(male>180) 
female164 <- as.integer(female>164)
sum(male180)/length(male180) 
tt <- triangular.test.prop(x=female164[1:3],
   y=male180[1:3], p1=0.4,p2=0.8,p0=0.1,
   alpha=0.05, beta=0.2)
tt <- update(tt,x=female164[4])
tt <- update(tt,y=male180[4])
tt <- update(tt,x=female164[5])
sum(female164)/length(female164)



