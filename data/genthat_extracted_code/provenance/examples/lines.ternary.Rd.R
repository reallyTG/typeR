library(provenance)


### Name: lines.ternary
### Title: Ternary line plotting
### Aliases: lines.ternary

### ** Examples

tern <- ternary(Namib$PT,'Q',c('KF','P'),c('Lm','Lv','Ls'))
plot(tern,pch=21,bg='red',labels=NULL)
middle <- matrix(c(0.01,0.49,0.01,0.49,0.98,0.02),2,3)
lines(ternary(middle))



