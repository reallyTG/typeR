library(Publish)


### Name: specialFrame
### Title: Special frame
### Aliases: specialFrame

### ** Examples


## Here are some data with an event time and no competing risks
## and two covariates X1 and X2.
## Suppose we want to declare that variable X1 is treated differently
## than variable X2. For example, X1 could be a cluster variable, or
## X1 should have a proportional effect on the outcome.
d <- data.frame(y=1:7,
                X2=c(2.24,3.22,9.59,4.4,3.54,6.81,5.05),
                X3=c(1,1,1,1,0,0,1),
                X4=c(44.69,37.41,68.54,38.85,35.9,27.02,41.84),
                X1=factor(c("a","b","a","c","c","a","b"),
                    levels=c("c","a","b")))
## define special functions prop and cluster
prop <- function(x)x
cluster <- function(x)x
## We pass a formula and the data
e <- specialFrame(y~prop(X1)+X2+cluster(X3)+X4,
                  data=d,
                  specials=c("prop","cluster"))
## The first element is the response
e$response
## The other elements are the design, i.e., model.matrix for the non-special covariates
e$design
## and a data.frame for the special covariates
e$prop
## The special covariates can be returned as a model.matrix 
e2 <- specialFrame(y~prop(X1)+X2+cluster(X3)+X4,
                   data=d,
                   specials=c("prop","cluster"),
                   specials.design=TRUE)
e2$prop
## and the non-special covariates can be returned as a data.frame
e3 <- specialFrame(y~prop(X1)+X2+cluster(X3)+X4,
                   data=d,
                   specials=c("prop","cluster"),
                   specials.design=TRUE,
                   unspecials.design=FALSE)
e3$design



