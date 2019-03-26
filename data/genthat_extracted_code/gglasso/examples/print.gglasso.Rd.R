library(gglasso)


### Name: print.gglasso
### Title: print a gglasso object
### Aliases: print.gglasso
### Keywords: models regression

### ** Examples

# load gglasso library
library(gglasso)

# load data set
data(colon)

# define group index
group <- rep(1:20,each=5)

# fit group lasso
m1 <- gglasso(x=colon$x,y=colon$y,group=group,loss="logit")

# print out results
print(m1)



