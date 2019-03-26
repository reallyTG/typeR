## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,comment = NA,fig.width=6,fig.height = 5, fig.align='center',out.width="90%")

## ----eval=FALSE----------------------------------------------------------
#  #install.packages("devtools")
#  devtools::install_github("cardiomoon/webr")

## ----message=FALSE-------------------------------------------------------
 require(moonBook)
 require(webr)
 
 # chi-squared test
 x=chisq.test(table(acs$sex,acs$DM))
 x
 plot(x)

## ------------------------------------------------------------------------
t.test(acs$age,mu=63)

plot(t.test(acs$age,mu=63))

## ------------------------------------------------------------------------
x=var.test(age~DM,data=acs)
x
plot(x)

## ------------------------------------------------------------------------
x=t.test(age~DM,data=acs)
x
plot(x)

## ------------------------------------------------------------------------
var.test(BMI~sex,data=acs)
plot(var.test(BMI~sex,data=acs))

## ------------------------------------------------------------------------
x=t.test(BMI~sex,data=acs,var.equal=TRUE)
x
plot(x)

## ------------------------------------------------------------------------
x=t.test(iris$Sepal.Width,iris$Petal.Width,paired=TRUE)
plot(x)

## ------------------------------------------------------------------------
x=t.test(BMI~sex, data=acs,conf.level=0.99,alternative="greater",var.equal=TRUE)
plot(x)

