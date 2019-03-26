## ----eval=FALSE----------------------------------------------------------
#  install.packages("palasso")

## ----eval=FALSE----------------------------------------------------------
#  #install.packages("devtools")
#  library(devtools)
#  install_github("rauschenberger/palasso")

## ---- message=FALSE------------------------------------------------------
library(glmnet)
library(palasso)

## ---- eval=FALSE---------------------------------------------------------
#  attach(toydata)

## ---- echo=FALSE---------------------------------------------------------
names <- names(toydata)
for(i in 1:length(names)){
    assign(names[i],toydata[[i]])
}
rm(names)

## ------------------------------------------------------------------------
object <- glmnet(y=y,x=X[[1]])
object <- glmnet(y=y,x=X[[2]])

## ------------------------------------------------------------------------
object <- palasso(y=y,X=X)

## ------------------------------------------------------------------------
object <- palasso(y=y,X=X,max=10)

## ----results='hide'------------------------------------------------------
weights(object)

## ----results='hide'------------------------------------------------------
fitted(object)

## ----results='hide'------------------------------------------------------
residuals(object)

## ----results='hide'------------------------------------------------------
predict(object,newdata=X)

