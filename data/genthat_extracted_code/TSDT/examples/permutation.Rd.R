library(TSDT)


### Name: permutation
### Title: permutation
### Aliases: permutation

### ** Examples

N <- 20
x <- data.frame( 1:N )
names( x ) <- "response"
x$trt <- factor( c( rep( "Experimental", 9 ), rep( "Control", N - 9 ) ) )
x$time <- x$response
x$event <- 0:1

## Permute treatment variable
ex1 <- x[,c("response","trt")]
ex1$permuted_trt <- permutation( trt = ex1$trt )

## Permute response variable
ex2 <- x[,c("response","trt")]
ex2$permuted_response <- permutation( response = ex2$response )

## Permute the response for treatment arm only
ex3 <- x[,c("response","trt")]
permuted3 <- permutation( response = ex3$response, trt = ex3$trt, permute_arm = "Experimental" )
names( permuted3 ) <- paste( "permuted_", names(permuted3), sep = "" )
ex3 <- cbind( ex3, permuted3 )

## Permute response and treatment together
ex4 <- x[,c("response","trt")]
permutation_list4 <- permutation( response = ex4$response, trt = ex4$trt )
ex4$permuted_response <- permutation_list4$response
ex4$permuted_trt <- permutation_list4$trt

## Permute a survival response for treatment arm only
ex5 <- x[,c("time","event","trt")]
permuted5 <- permutation( response = ex5[,c("time","event")], trt = ex5$trt,
                          permute_arm = "Experimental" )
names( permuted5 ) <- paste( "permuted_", names(permuted5), sep = "" )
ex5 <- cbind( ex5, permuted5 )

## Permute a survival outcome and treatment together
ex6 <- x[,c("time","event","trt")]
permutation_list6 <- permutation( response = ex6[,c("time","event")], trt = ex6$trt )
ex6$permuted_time <- permutation_list6$response$time
ex6$permuted_event <- permutation_list6$response$event



