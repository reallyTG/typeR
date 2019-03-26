library(rrecsys)


### Name: recommend
### Title: Generate recommendation.
### Aliases: recommendHPR recommendMF

### ** Examples


myratings <- matrix(sample(c(0:5), size = 200, replace = TRUE, 
        prob = c(.6,.08,.08,.08,.08,.08)), nrow = 20, byrow = TRUE)

myratings <- defineData(myratings)

r <- rrecsys(myratings, alg = "FunkSVD", k = 2)

rec <- recommendHPR(r)




