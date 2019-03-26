library(DoE.base)


### Name: qua.design
### Title: Function to switch between qualitative and quantitative factors
###   and different contrast settings
### Aliases: qua.design change.contr
### Keywords: design array

### ** Examples

## usage with all factors treated alike
y <- rnorm(12)
plan <- oa.design(nlevels=c(2,6,2))
lm(y~.,plan)
lm(y~., change.contr(plan))   ## with treatment contrasts instead
plan <- qua.design(plan, quantitative = "none")
lm(y~.,plan)
plan <- qua.design(plan, quantitative = "none", contrasts=c(B="contr.treatment"))
lm(y~.,plan)
plan <- qua.design(plan, quantitative = "none")
lm(y~.,plan)

plan <- qua.design(plan, quantitative = "all")
lm(y~.,plan)
plan <- qua.design(plan)  ## NA resets to default state
lm(y~.,plan)

## usage with individual factors treated differently
plan <- oa.design(factor.names = list(liquid=c("type1","type2"), 
     dose=c(0,10,50,100,200,500), temperature=c(10,15)))
str(undesign(plan))
## Not run: 
##D ## would cause an error, since liquid is character and cannot be reasonably coerced to numeric
##D plan <- qua.design(plan, quantitative = "all")
## End(Not run)
plan <- qua.design(plan, quantitative = "none")
str(undesign(plan))

plan <- qua.design(plan, quantitative = c(dose=TRUE,temperature=TRUE))
str(undesign(plan))
## reset all factors to default
plan <- qua.design(plan, quantitative = NA)
str(undesign(plan))
desnum(plan)
## add a response
y <- rnorm(12)
plan <- add.response(plan,y)
## set dose to treatment contrasts
plan <- qua.design(plan, quantitative = c(dose=FALSE), contrasts=c(dose="contr.treatment"))
str(undesign(plan))
desnum(plan)



