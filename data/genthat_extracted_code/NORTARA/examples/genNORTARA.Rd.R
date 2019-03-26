library(NORTARA)


### Name: genNORTARA
### Title: Generates samples with specified input correlation matrix and
###   marginal distributions.
### Aliases: genNORTARA

### ** Examples

## Not run: 
##D invcdfnames <- c("qt","qpois","qnorm","qweibull","qunif")
##D # The following usage :
##D # a <- qt; b <- qnorm; f <- stats::qweibull (It is also the way you can use functions
##D # from other packages)
##D # invcdfnames <- c("a","qpois","b","f","qunif") will also be ok!
##D paramslists <- list(
##D                m1 = list(df = 3),
##D                m2 = list(lambda = 5),
##D                m4 = list(shape = 1)
##D                  )
##D defaultindex <- c(3,5)
##D #It means the 3rd and 5th invcdf should use its default arguments.
##D #That means qnorm using mean = 0, sd = 1, qunif using min =0 ,max =1 and so on.
##D cor_matrix <- matrix(c(1.0,-0.4,0.1,0.7,-0.2,-0.4,
##D                       1.0,0.4,0.4,0.9,0.1,0.4,1.0,
##D                       0.5,0.5,0.7, 0.4,0.5,1.0,
##D                       0.7,-0.2,0.9,0.5,0.7,1.0),5,5)
##D 
##D res <- genNORTARA(10000,cor_matrix,invcdfnames,paramslists,defaultindex)
##D #May get warning message indicating nearest positive definite is used,It's
##D #normal but the cor(res) may not very close to cor_matrix.
##D cor(res)
##D invcdfnames <- c("qt","qpois","qnorm")
##D paramslists <- list(
##D                m1 = list(df = 3),
##D                m2 = list(lambda = 5)
##D                  )
##D defaultindex <- 3
##D cor_matrix <- matrix(c(1,0.5,-0.3,0.5,1,0.4,-0.3,0.4,1), 3)
##D res <- genNORTARA(10000,cor_matrix,invcdfnames,paramslists,defaultindex)
##D cor(res) #This time cor(res) may very close to cor_matrix.
## End(Not run)



