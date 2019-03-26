library(provenance)


### Name: ternary
### Title: Define a ternary composition
### Aliases: ternary

### ** Examples

data(Namib)
tern <- ternary(Namib$PT,c('Q'),c('KF','P'),c('Lm','Lv','Ls'))
plot(tern,type="QFL")



