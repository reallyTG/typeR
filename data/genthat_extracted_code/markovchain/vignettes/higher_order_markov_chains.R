### R code from vignette source 'higher_order_markov_chains.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: setup
###################################################
	options(prompt = "R> ", continue = "+  ", 
			width = 70, useFancyQuotes = FALSE)
	set.seed(123)


###################################################
### code chunk number 2: higherOrder
###################################################
require(markovchain)
library(Rsolnp)
data(rain)
fitHigherOrder(rain$rain, 2)
fitHigherOrder(rain$rain, 3)


###################################################
### code chunk number 3: hommcObject
###################################################
showClass("hommc")


###################################################
### code chunk number 4: hommcCreate
###################################################
states <- c('a', 'b')
P <- array(dim = c(2, 2, 4), dimnames = list(states, states))
P[ , , 1] <- matrix(c(1/3, 2/3, 1, 0), byrow = FALSE, nrow = 2, ncol = 2)

P[ , , 2] <- matrix(c(0, 1, 1, 0), byrow = FALSE, nrow = 2, ncol = 2)

P[ , , 3] <- matrix(c(2/3, 1/3, 0, 1), byrow = FALSE, nrow = 2, ncol = 2)

P[ , , 4] <- matrix(c(1/2, 1/2, 1/2, 1/2), byrow = FALSE, nrow = 2, ncol = 2)

Lambda <- c(.8, .2, .3, .7)

hob <- new("hommc", order = 1, Lambda = Lambda, P = P, states = states, 
           byrow = FALSE, name = "FOMMC")
hob


###################################################
### code chunk number 5: hommsales
###################################################
data(sales)
head(sales)


###################################################
### code chunk number 6: hommcFit
###################################################
# fit 8th order multivariate markov chain
object <- fitHighOrderMultivarMC(sales, order = 8, Norm = 2)


###################################################
### code chunk number 7: result
###################################################
i <- c(1, 2, 2, 3, 4, 4, 4, 5, 5, 5)
j <- c(2, 2, 2, 5, 2, 5, 5, 2, 4, 5)
k <- c(1, 1, 3, 1, 8, 1, 2, 8, 1, 2)

if(object@byrow == TRUE) {
    direction <- "(by rows)" 
} else {
    direction <- "(by cols)" 
}

cat("Order of multivariate markov chain =", object@order, "\n")
cat("states =", object@states, "\n")

cat("\n")
cat("List of Lambda's and the corresponding transition matrix", direction,":\n")

for(p in 1:10) {
  t <- 8*5*(i[p]-1) + (j[p]-1)*8
  cat("Lambda", k[p], "(", i[p], ",", j[p], ") : ", object@Lambda[t+k[p]],"\n", sep = "")
  cat("P", k[p], "(", i[p], ",", j[p], ") : \n", sep = "")
  print(object@P[, , t+k[p]])
  cat("\n")
}  
  


