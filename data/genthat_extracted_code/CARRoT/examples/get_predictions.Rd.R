library(CARRoT)


### Name: get_predictions
### Title: Predictions for multinomial regression
### Aliases: get_predictions

### ** Examples

#binary mode

get_predictions(runif(20,0.4,0.6),20,0.5,'det','binary')

#creating a data-set for multinomial mode

p1<-runif(20,0.4,0.6)
p2<-runif(20,0.1,0.2)
p3<-1-p1-p2

#running the function

get_predictions(matrix(c(p1,p2,p3),ncol=3),20,0.5,'det','multin')



