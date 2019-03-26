library(provenance)


### Name: text.ternary
### Title: Ternary text plotting
### Aliases: text.ternary

### ** Examples

data(Namib)
tern <- ternary(Namib$Major,'CaO','Na2O','K2O')
plot(tern,pch=21,bg='red',labels=NULL)
# add the geometric mean composition as a text label:
gmean <- ternary(exp(colMeans(log(tern$x))))
text(gmean,labels='geometric mean')



