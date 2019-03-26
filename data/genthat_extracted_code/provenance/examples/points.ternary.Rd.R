library(provenance)


### Name: points.ternary
### Title: Ternary point plotting
### Aliases: points.ternary lines text

### ** Examples

tern <- ternary(Namib$PT,'Q',c('KF','P'),c('Lm','Lv','Ls'))
plot(tern,pch=21,bg='red',labels=NULL)
# add the geometric mean composition as a yellow square:
gmean <- ternary(exp(colMeans(log(tern$x))))
points(gmean,pch=22,bg='yellow')



