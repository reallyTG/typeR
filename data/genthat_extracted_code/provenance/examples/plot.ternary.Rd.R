library(provenance)


### Name: plot.ternary
### Title: Plot a ternary diagram
### Aliases: plot.ternary

### ** Examples

data(Namib)
tern <- ternary(Namib$PT,'Q',c('KF','P'),c('Lm','Lv','Ls'))
plot(tern,type='QFL.descriptive',pch=21,bg='red',labels=NULL)



