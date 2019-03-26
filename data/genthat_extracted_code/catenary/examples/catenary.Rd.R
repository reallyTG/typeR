library(catenary)


### Name: catenary
### Title: Creates a catenary object
### Aliases: catenary catenary catenary-package

### ** Examples

cat1 <- catenary()
plot(cat1)
cat2 <- catenary(c1=1,c2=2,lambda=3,x0=0,x1=4)
plot(cat2)
x <- c(-1,1)
y <- c(2,2)
endpoints <- data.frame(x=x,y=y)
cat3 <- catenary(endpoints=endpoints,L=5)
plot(cat3)
cat4 <- catenary(endpoints=endpoints,type='natural')
plot(cat4)
cat5 <- catenary(endpoints=endpoints,type='max')
plot(cat5)



