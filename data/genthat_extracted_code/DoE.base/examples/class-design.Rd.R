library(DoE.base)


### Name: Class design and accessors
### Title: Class design and its accessor functions
### Aliases: design undesign redesign desnum desnum<- run.order run.order<-
###   design.info design.info<- factor.names factor.names<- response.names
###   response.names<- col.remove ord
### Keywords: array design

### ** Examples

oa12 <- oa.design(nlevels=c(2,2,6))


#### Examples for factor.names and response.names
  factor.names(oa12)
  ## rename factors
  factor.names(oa12) <- c("First.Factor", "Second.Factor", "Third.Factor")
  ## rename factors and relabel levels of first two factors
  namen <- c(rep(list(c("current","new")),2),list(""))
  names(namen) <- c("First.Factor", "Second.Factor", "Third.Factor")
  factor.names(oa12) <- namen
  oa12

  ## add a few variables to oa12
  responses <- cbind(temp=sample(23:34),y1=rexp(12),y2=runif(12))
  oa12 <- add.response(oa12, responses)
  response.names(oa12)
  ## temp (for temperature) is not meant to be a response 
  ## --> drop it from responselist but not from data
  response.names(oa12) <- c("y1","y2")

## looking at attributes of the design
  desnum(oa12)
  run.order(oa12)
  design.info(oa12)

## undesign and redesign
  u.oa12 <- undesign(oa12)
  str(u.oa12)  
  u.oa12$new <- rnorm(12)
  r.oa12 <- redesign(oa12, u.oa12)
## make known that new is also a response
  response.names(r.oa12) <- c(response.names(r.oa12), "new") 
## look at design-specific summary
  summary(r.oa12)
## look at data frame style summary instead
  summary.data.frame(r.oa12)




