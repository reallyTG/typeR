## ----results="hide"------------------------------------------------------
library(unifed)
dunifed( c(0.1,0.3,0.7), 10)

x <- c(0.1,0.4,0.7,1)
punifed(x,-5)

p <- 1:9/10
qunifed(p,5)

runifed(20,-3.3)

## ----echo=F,fig.align='center'-------------------------------------------
library(unifed)

add.theta.plot <- function(theta,mu,right=F,...){
    N <- 100
    x <- seq(0,1,length.out=N)
    y <- dunifed(x,theta=theta)
    points(x,y,type="l",...)
    label <- substitute(expression(mu == val),env=list(val=mu))
    if(right)
        text(x[N],y[N],labels=eval(label),pos="2",cex=0.8)
    else
        text(x[1],y[1],labels=eval(label),pos="4",cex=0.8)
       
}

unifed.density.plots1 <- function(){
    par(mar=c(2,2,0.5,0.5))
    plot(x=c(0,1),y=c(0,10),type="n",xlab="",ylab="",ylim=c(0,10.2),xlim=c(-0.05,1))
    mu.vector <- seq(0.1,0.5,by=0.1)
    theta.vector <- unifed.kappa.prime.inverse(mu.vector)
    for(i in 1:length(theta.vector)){
        theta <- add.theta.plot(theta.vector[i],mu.vector[i],lty=i)}
    
}

unifed.density.plots2 <- function(){
    par(mar=c(2,2,0.5,0.5))
    plot(x=c(0,1),y=c(0,10),type="n",xlab="",ylab="",ylim=c(0,10.2),xlim=c(0,1.05))
    mu.vector <- seq(0.5,0.9,by=0.1)
    theta.vector <- unifed.kappa.prime.inverse(mu.vector)
    for(i in 1:length(theta.vector)){
        theta <- add.theta.plot(theta.vector[i],mu.vector[i],T,lty=length(theta.vector)+1-i )}
    
}


par(mfrow=c(1,2))
## Densities with mean less than one
unifed.density.plots1()

## Densities with mean greater than one
unifed.density.plots2()


## ----results='hide'------------------------------------------------------
 log( ( exp(50) - 1) / 50  ) - ( 50 - log (50) )

## ----fig.align='center'--------------------------------------------------
x <- seq(0,1,length.out=100)
y <- unifed.varf(x)
plot(x,y,type="l",xlab=expression(mu),ylab=expression(bold(V)(mu)),main="Unifed Variance Function")

## ----results="hide",eval=FALSE-------------------------------------------
#  download.file("http://www.businessandeconomics.mq.edu.au/our_departments/Applied_Finance_and_Actuarial_Studies/acst_docs/glms_for_insurance_data/data/car.csv",destfile="car.csv")

## ----results="hide",eval=FALSE-------------------------------------------
#  car.data <- read.csv("car.csv")
#  car.data$agecat <- factor(car.data$agecat)
#  car.data$veh_age <- factor(car.data$veh_age)
#  
#  agg.car.data <- aggregate( cbind(exposure,rep(1, dim(car.data)[1] )) ~ gender + agecat + area + veh_age,
#                            data=car.data,
#                            FUN=sum)
#  
#  colnames(agg.car.data)[colnames(agg.car.data) == "V2"] <- "weight"
#  colnames(agg.car.data)[colnames(agg.car.data) == "exposure"] <- "class.exposure"
#  agg.car.data$class.exposure <- agg.car.data$class.exposure / agg.car.data$weight

## ----results="hide",eval=FALSE-------------------------------------------
#  library(data.table)
#  car.data <- fread("car.csv")
#  car.data[,agecat:=factor(agecat)]
#  car.data[,veh_age:=factor(veh_age)]
#  
#  agg.car.data <- car.data[,.(class.exposure=sum(exposure)/.N,
#                              weight=.N),
#                              by=.(gender,agecat,area,veh_age)]

## ----results="hide",eval=FALSE-------------------------------------------
#  exposure.model <- glm(class.exposure ~ gender + agecat + area + veh_age,
#                   family=unifed(),
#                   weights=weight,
#                   data=agg.car.data)

## ----eval=FALSE----------------------------------------------------------
#  summary(exposure.model)

## ----fig.align='center',eval=FALSE---------------------------------------
#  plot(predict(exposure.model, type="response"),
#       residuals(exposure.model, type="deviance"),
#       xlab="Predicted value",
#       ylab="Deviance residuals")

## ----eval=FALSE----------------------------------------------------------
#  exposure.model.2 <- glm(exposure ~ gender + agecat + area + veh_age,
#                          family=unifed(),
#                          data=car.data)

## ----eval=FALSE----------------------------------------------------------
#  exposure.model <- glm(class.exposure ~ gender + agecat + area + veh_age,
#                        family=unifed(),
#                        weights=weight,
#                        control=list(epsilon=1e-20,maxit=1e5),
#                        data=agg.car.data)
#  
#  exposure.model.2 <- glm(exposure ~ gender + agecat + area + veh_age,
#                          family=unifed(),
#                          control=list(epsilon=1e-20,maxit=1e5),
#                          data=car.data)

