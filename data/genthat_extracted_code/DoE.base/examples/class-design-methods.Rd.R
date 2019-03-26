library(DoE.base)


### Name: Methods for class design objects
### Title: Methods for class design objects
### Aliases: [.design aggregate.design print.design summary.design
###   class-design-methods
### Keywords: array design

### ** Examples

oa12 <- oa.design(nlevels=c(2,2,6))
#### Examples for extractor function
  ## subsetting to half the runs drops all attributes per default
  oa12[1:6,]
  ## keep the attributes (usually not reasonable, but ...)
  oa12[1:6, drop.attr=FALSE]
  ## reshuffling a design
  ## (re-)randomize
  oa12[sample(12),]
  ## add repeated measurements
  oa12[rep(1:12,each=3),]
  ## add a proper replication 
  ## (does not work for blocked designs)
  oa12[c(sample(12),sample(12)),]
  ## subsetting and rbinding to loose also contrasts of factors
  str(rbind(oa12[1:2,],oa12[3:12]))
  ## keeping all non-design-related attributes like the contrasts
  str(undesign(oa12))

#### Examples print and summary
  ## rename factors and relabel levels of first two factors
  namen <- c(rep(list(c("current","new")),2),list(""))
  names(namen) <- c("First.Factor", "Second.Factor", "Third.Factor")
  factor.names(oa12) <- namen
  oa12   ### printed with the print method!

  ## add a few variables to oa12
  responses <- cbind(temp=sample(23:34),y1=rexp(12),y2=runif(12))
  oa12 <- add.response(oa12, responses)
  response.names(oa12)
  ## temp (for temperature) is not meant to be a response 
  ## --> drop it from responselist but not from data
  response.names(oa12) <- c("y1","y2")

## print design
  oa12
## look at design-specific summary
  summary(oa12)
## look at data frame style summary instead
  summary.data.frame(oa12)
  
## aggregation examples
  plan <- oa.design(nlevels=c(2,6,2), replications=2, repeat.only=TRUE)
  y <- rnorm(24)
  z <- rexp(24)
  plan <- add.response(plan, cbind(y=y,z=z))
  plan <- reptowide(plan)
  plan.mean <- aggregate(plan)
  plan.mean
  aggregate(plan, response="z")
  aggregate(plan, FUN=sd)
  aggregate(plan, FUN = function(obj) max(obj) - min(obj), postfix="range")
  ## several aggregates: add standard deviations to plan with means
  plan.mean.sd <- aggregate(plan.mean, FUN=sd)
  plan.mean.sd
  response.names(plan.mean.sd)
  ## change response.names element of design.info back to y.mean and z.mean
  ## may be needed for automatic analysis routines that have not been 
  ## created yet
  plan.mean.sd <- aggregate(plan.mean.sd, FUN=mean)
  plan.mean.sd
  response.names(plan.mean.sd)



