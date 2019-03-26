library(gamlss.dist)


### Name: make.link.gamlss
### Title: Create a Link for GAMLSS families
### Aliases: make.link.gamlss show.link own.linkfun own.linkinv own.mu.eta
###   own.valideta
### Keywords: regression

### ** Examples

str(make.link.gamlss("logshiftto1"))
l2<-make.link.gamlss("logshiftto1")
l2$linkfun(2) # should close to zero (Note that 0.00001 is added)
l2$linkfun(1-0.00001) # should be -Inf but it is large negative
#---------------------------------------------------------
# now use the own link function
# first if the distribution allows you
show.link(BI)
# seems OK now define the four own functions
# First try the probit link using the own link function
# 1: the linkfun function
own.linkfun <- function(mu) { qNO(p=mu)}
# 2: the inverse link function 
own.linkinv <- function(eta) { 
              thresh <- -qNO(.Machine$double.eps)
               eta <- pmin(thresh, pmax(eta, -thresh))
              pNO(eta)}
# 3: the dmu/deta function 
own.mu.eta <- function(eta) pmax(dNO(eta), .Machine$double.eps)
# 4: the valideta function 
own.valideta <- function(eta) TRUE

## bring the data
# library(gamlss) 
#data(aep)
# fitting the model using "own"   
# h1<-gamlss(y~ward+loglos+year, family=BI(mu.link="own"), data=aep)  
# model h1 should be identical to the probit 
# h2<-gamlss(y~ward+loglos+year, family=BI(mu.link="probit"), data=aep)
# now using a function instead of "own" 
probittest <- function()
{
linkfun <- function(mu) { qNO(p=mu)}
linkinv <- function(eta) 
            { 
              thresh <- -qNO(.Machine$double.eps)
               eta <- pmin(thresh, pmax(eta, -thresh))
              pNO(eta)
            }
mu.eta <- function(eta) pmax(dNO(eta), .Machine$double.eps) 
valideta <- function(eta) TRUE
link <- "probitTest"
structure(list(linkfun = linkfun, linkinv = linkinv, mu.eta = mu.eta, 
        valideta = valideta, name = link), class = "link-gamlss")
}
# h3<-gamlss(y~ward+loglos+year, family=BI(mu.link=probittest()), data=aep)  
# Second try the complementary log-log 
# using the Gumbel distribution  
own.linkfun <- function(mu) { qGU(p=mu)} 
own.linkinv <- function(eta) { 
              thresh <- -qGU(.Machine$double.eps)
               eta <- pmin(thresh, pmax(eta, -thresh))
              pGU(eta)} 
own.mu.eta <- function(eta) pmax(dGU(eta), .Machine$double.eps)
own.valideta <- function(eta) TRUE
# h1 and h2 should be identical to cloglog
# h1<-gamlss(y~ward+loglos+year, family=BI(mu.link="own"), data=aep)  
# h2<-gamlss(y~ward+loglos+year, family=BI(mu.link="cloglog"), data=aep)
# note that the Gumbel distribution is negatively skew
# for a positively skew link function we can used the Reverse Gumbel 
revloglog  <- function()
{
linkfun <- function(mu) { qRG(p=mu)} 
linkinv <- function(eta) { 
              thresh <- -qRG(.Machine$double.eps)
               eta <- pmin(thresh, pmax(eta, -thresh))
              pRG(eta)}
mu.eta <- function(eta) pmax(dRG(eta), .Machine$double.eps)
valideta <- function(eta) TRUE
link <- "revloglog"
structure(list(linkfun = linkfun, linkinv = linkinv, mu.eta = mu.eta, 
        valideta = valideta, name = link), class = "link-gamlss")
}
# h1<-gamlss(y~ward+loglos+year, family=BI(mu.link=revloglog()), data=aep)  
# a considerable improvement in the deviance
# try a shifted logit link function from -1, 1 
own.linkfun <- function(mu)
             { shift = c(-1,1)           
               log((mu-shift[1])/(shift[2]-mu))
             }
own.linkinv <- function(eta) 
            {
            shift = c(-1,1)  
            thresh <- -log(.Machine$double.eps)
               eta <- pmin(thresh, pmax(eta, -thresh))
                      shift[2]-(shift[2]-shift[1])/(1 + exp(eta))
            } 
own.mu.eta <- function(eta) 
            {
        shift = c(-1,1)  
            thresh <- -log(.Machine$double.eps)
               res <- rep(.Machine$double.eps, length(eta))
            res[abs(eta) < thresh] <- ((shift[2]-shift[1])*exp(eta)/(1 + 
                                 exp(eta))^2)[abs(eta) < thresh]
            res
            }
own.valideta <- function(eta) TRUE       
#----------
str(make.link.gamlss("own"))
l2<-make.link.gamlss("own")
l2$linkfun(0) # should be zero
l2$linkfun(1) # should be Inf
l2$linkinv(-5:5)



