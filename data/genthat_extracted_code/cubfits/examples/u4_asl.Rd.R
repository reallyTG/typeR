library(cubfits)


### Name: Asymmetric Laplace Distribution
### Title: The Asymmetric Laplace Distribution
### Aliases: dasl dasla pasl pasla qasl qasla rasl rasla asl.optim
### Keywords: utility

### ** Examples

## Not run: 
##D suppressMessages(library(cubfits, quietly = TRUE))
##D set.seed(1234)
##D 
##D dasl(-2:2)
##D dasla(-2:2)
##D pasl(-2:2)
##D pasla(-2:2)
##D qasl(seq(0, 1, length = 5))
##D qasla(seq(0, 1, length = 5))
##D 
##D dasl(-2:2, log = TRUE)
##D dasla(-2:2, log = TRUE)
##D pasl(-2:2, log.p = TRUE)
##D pasla(-2:2, log.p = TRUE)
##D qasl(log(seq(0, 1, length = 5)), log.p = TRUE)
##D qasla(log(seq(0, 1, length = 5)), log.p = TRUE)
##D 
##D set.seed(123)
##D rasl(5)
##D rasla(5)
##D 
##D asl.optim(rasl(5000))
## End(Not run)



