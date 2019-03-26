library(FrF2)


### Name: fold.design
### Title: Function to create a foldover for 2-level fractional factorials
### Aliases: fold.design
### Keywords: design array

### ** Examples

  ## create resolution III design
  plan <- FrF2(8,5, factor.names=c("one","two","three","four","five"))
  ## add some resonse data
  y <- c(2+desnum(plan)%*%c(2,3,0,0,0) +
     1.5*apply(desnum(plan)[,c(1,2)],1,"prod") + rnorm(8))
     ## the "c()" makes y into a vector rather than a 1-column matrix
  plan <- add.response(plan, y)
  DanielPlot(lm(y~(.)^2,plan), alpha=0.2, half=TRUE)
  ## alias information
  design.info(plan)
  ## full foldover for dealiasing all main effects
  plan <- fold.design(plan)
  design.info(plan)
  ## further data, shifted by -2
  y <- c(y, desnum(plan)[9:16,1:5]%*%c(2,3,0,0,0) +
     1.5*apply(desnum(plan)[9:16,c(1,2)],1,"prod") + rnorm(8))
  plan <- add.response(plan, y, replace=TRUE)
  linmod <- lm(y~(.)^2,plan)
  DanielPlot(linmod, alpha=0.2, half=TRUE)
  MEPlot(linmod)
  IAPlot(linmod)
  
  ## fold on factor a only (also removes main effect aliasing here)
  plan <- FrF2(8,5, factor.names=c("one","two","three","four","five"))
  aliasprint(plan)
  plan <- fold.design(plan, columns=1)
  aliasprint(plan)
  
  ## fold a Plackett-Burman design with 11 factors
  plan <- pb(12)
  fold.design(plan)
   


