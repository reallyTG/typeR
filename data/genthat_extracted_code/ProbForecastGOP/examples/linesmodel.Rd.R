library(ProbForecastGOP)


### Name: linesmodel
### Title: Computation of parametric variogram model
### Aliases: linesmodel
### Keywords: file

### ** Examples

## Loading data
data(slp)
day <- slp$date.obs
id <- slp$id.stat
coord1 <- slp$lon.stat
coord2 <- slp$lat.stat
obs <- slp$obs
forecast <- slp$forecast

## Computing empirical variogram
variogram <- Emp.variog(day=day,obs=obs,forecast=forecast,id=id,coord1=coord1,
coord2=coord2,cut.points=NULL,max.dist=NULL,nbins=NULL)

## Estimating variogram parameters
## Without specifying initial values for the parameters
param.variog <- 
Variog.fit(emp.variog=variogram,variog.model="exponential",max.dist.fit=NULL,
init.val=NULL,fix.nugget=FALSE)

## Plotting the empirical variogram with the estimated parametric variogram superimposed
plot(variogram$bin.midpoints,variogram$empir.variog,xlab="Distance",ylab="Semi-variance")
lines(variogram$bin.midpoints,linesmodel(distance=variogram$bin.midpoints,variog.model="exponential",param=c(param.variog$nugget,
param.variog$variance,param.variog$range)))


## Don't show: 
## The function is currently defined as
function(distance,variog.model="exponential",param){
# INPUT CHECK
if(missing(distance)){
  stop("Invalid input")
  }

if(missing(variog.model)){
  stop("Invalid input")
  }

if(missing(param)){
  stop("Invalid input")
  }

# Here we check if the vector of distances is well-defined
l.dist <- length(distance)
if(l.dist <1){
  stop("Invalid input")
  }

if(l.dist>=1 & (sum(is.numeric(distance)==rep("TRUE",l.dist)) < l.dist)){
  stop("distance should be a numeric vector")
  }

if(l.dist>=1 & (sum(is.numeric(distance)==rep("TRUE",l.dist))==l.dist)){
  if(sum(distance >=0) < l.dist){
   stop("Entries in distance should be non-negative numbers")
   }
  if(sum(order(distance)==seq(1:l.dist))<l.dist){
   stop("Entries in distance should be in ascending order")
   }
  }

# Here we check the parametric variogram model
l.variog <- length(variog.model)
case.var <- 0
if(l.variog==0){
   variog.model <- "exponential"
   case.var <- 1
  }

if(l.variog==1){
  if(is.character(variog.model)=="TRUE"){
    if(variog.model=="exponential"){
        case.var <- 1}
    if(variog.model=="spherical"){
        case.var <- 1}
    if(variog.model=="whittlematern" | variog.model=="matern"){
        case.var <- 1}
    if(variog.model=="gencauchy"){
        case.var <- 1}
    if(variog.model=="gauss"){
        case.var <- 1}
  }

  }

if(variog.model=="matern"){variog.model <- "whittlematern"}


if(case.var==0){
   stop("Incorrect variogram model specification")
  }


# Here we check the vector with the parameters value
l.par <- length(param)
if(l.par<3){
  stop("Invalid input: the parameter should be a vector of length at least equal to 3")
  }

if(variog.model=="exponential" | variog.model=="spherical" | variog.model=="gauss"){
  if(l.par!=3){
   stop("The parameter vector should have length equal to 3")
  }
  if(l.par==3){
   if(param[1] <0 | param[2] <=0 | param[3] <=0){
    stop("Invalid input for at least one of the parameters")
   }
  }
  }

if(variog.model=="whittlematern"){
  if(l.par!=4){
  stop("The parameter vector should have length equal to 4")
  }
  if(l.par==4){
   if(param[1] <0 | param[2] <=0 | param[3] <=0 | param[4] <=0){
    stop("Invalid input for at least one of the parameters")
   }
  }
  }


if(variog.model=="gencauchy"){
  if(l.par!=5){
  stop("The parameter vector should have length equal to 5")
  }
  if(l.par==5){
   if(param[1] <0 | param[2] <=0 | param[3] <=0 | (param[4] <=0 & param[4]>2) | param[5] <= 0){
    stop("Invalid input for at least one of the parameters")
   }
  }
  }



# This is where the function really starts

if(variog.model=="spherical"){
 fitted.values <- (param[1]+param[2]*(1.5*(distance/param[3])-0.5*(distance/param[3])^3))}
    
if(variog.model=="gauss"){
 fitted.values <- (param[1]+param[2]*(1-exp(-(distance/param[3])^2)))}

if(variog.model=="exponential"){
 fitted.values <- (param[1]+param[2]*(1-exp(-distance/param[3])))}

if(variog.model=="whittlematern" | variog.model=="matern"){
 fitted.values <- 
(param[1]+param[2]-param[2]*(((2^(1-param[4]))/gamma(param[4]))*((distance/param[3])^(param[4]))*besselK(distance/param[3],param[4],expon.scaled=FALSE)))}

if(variog.model=="gencauchy"){
 fitted.values <- (param[1]+param[2]*(1-(1+((distance^2)/param[3])^param[4])^(-param[5]/param[4])))}

return(fitted.values)
  }
## End(Don't show)



