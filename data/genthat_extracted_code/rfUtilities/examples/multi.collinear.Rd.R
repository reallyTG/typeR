library(rfUtilities)


### Name: multi.collinear
### Title: Multi-collinearity test
### Aliases: multi.collinear

### ** Examples

 
test <- data.frame(v1=seq(0.1, 5, length=100), v2=seq(0.1, 5, length=100), 
                   v3=dnorm(runif(100)), v4=dnorm(runif(100)))
					
# Single test					
  ( cl <- multi.collinear(test) )

# Permutated test with leave out	
( cl.test <- multi.collinear(test, perm = TRUE, leave.out = TRUE, n = 999) )
    cl.test[cl.test$frequency > 0,]$variables
			       
 # Remove identified variable(s)
 head( test[,-which(names(test) %in% cl.test[cl.test$frequency > 0,]$variables)] )




