library(FrF2)


### Name: add.center
### Title: Function to add center points to a 2-level fractional factorial
### Aliases: add.center
### Keywords: design array

### ** Examples

  ## purely technical example 
  plan <- FrF2(8,5, factor.names=c("one","two","three","four","five"))
  add.center(plan, 6)
  add.center(plan, 6, distribute=1)
  add.center(plan, 6, distribute=6)
  add.center(plan, 6, distribute=4)
  
  ## very artificial analysis example
    plan <- FrF2(8,4, factor.names=list(one=c(0,10),two=c(1,3),three=c(25,32),four=c(3.7,4.8)))
  ## add some response data
    y <- c(2+desnum(plan)%*%c(2,3,0,0) +
       1.5*apply(desnum(plan)[,c(1,2)],1,"prod") + rnorm(8))
       ## the "c()" makes y into a vector rather than a 1-column matrix
    plan <- add.response(plan, y)
  ## analysing this design provides an impression
    MEPlot(lm(y~(.)^2, plan))
    IAPlot(lm(y~(.)^2, plan))
    DanielPlot(lm(y~(.)^2,plan), half=TRUE, alpha=0.2)
  ## tentative conclusion: factors one and two do something
  ## wonder whether the model with one and two and their interaction is sufficient
  ## look at center points (!!! SHOULD HAVE BEEN INCLUDED FROM THE START,
  ##      but maybe better now than not at all)
  ## use distribute=1, because all center points are run at the end
    planc <- add.center(plan, 6, distribute=1)
      ## conduct additional runs for the center points
        y <- c(y, c(2+desnum(planc)[!iscube(planc),1:4]%*%c(2,3,0,0) +
             1.5*apply(desnum(planc)[!iscube(planc),][,c(1,2)],1,"prod") + rnorm(6)))
  ## add to the design
    planc <- add.response(planc, y, replace=TRUE)
  ## sanity check: repeat previous analyses for comparison, with the help of function iscube()
    MEPlot(lm(y~(.)^2, planc, subset=iscube(planc)))
    IAPlot(lm(y~(.)^2, planc, subset=iscube(planc)))
    DanielPlot(lm(y~(.)^2, planc, subset=iscube(planc)), half=TRUE, alpha=0.2)
  ## quick check whether there a quadratic effect is needed: is the cube indicator significant ?
    summary(lm(y~(.)^2+iscube(planc), planc))
        ## (in this unrealistic example, the quadratic effect is dominating everything else;
        ## with an effect that strong in practice, it is likely that
        ## one would either have expected a strong non-linearity before conducting the experiment, 
        ## OR that the effect is not real but the result of some stupid mistake
  ## alternatively, the check can be calculated per hand (cf. e.g. Montgomery, Chapter 11):
    (mean(planc$y[iscube(planc)])-mean(planc$y[!iscube(planc)]))^2*8*6/(8+6)/var(y[!iscube(planc)])
    ## must be compared to the F-quantile with 1 degree of freedom
    ## is the square of the t-value for the cube indicator in the linear model
   


