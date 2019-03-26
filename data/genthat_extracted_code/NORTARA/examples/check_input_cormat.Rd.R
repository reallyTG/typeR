library(NORTARA)


### Name: check_input_cormat
### Title: Test the input correlation matrix weather it is in the feasible
###   bounds.
### Aliases: check_input_cormat

### ** Examples

## Not run: 
##D invcdfnames <- c("qt","qpois","qnorm")
##D paramslists <- list(
##D                m1 = list(df = 3),
##D                m2 = list(lambda = 5),
##D                m3 = list(mean = 0, sd = 1)
##D                  )
##D cor_matrix_correct <- matrix(c(1,0.5,-0.3,0.5,1,0.4,-0.3,0.4,1), 3)
##D cor_matrix_wrong <- matrix(c(1,0.94,-0.3,0.94,1,0.4,-0.3,0.4,1), 3)
##D check_input_cormat(invcdfnames, paramslists, cor_matrix_correct)
##D check_input_cormat(invcdfnames, paramslists, cor_matrix_wrong)
## End(Not run)



