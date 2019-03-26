library(npmlreg)


### Name: predict.glmmNPML
### Title: Prediction from objects of class glmmNPML or glmmGQ
### Aliases: predict.glmmNPML predict.glmmGQ
### Keywords: models regression

### ** Examples

 # Toxoplasmosis data:
    data(rainfall)
    rainfall$x<-rainfall$Rain/1000
    toxo.0.3x<- alldist(cbind(Cases,Total-Cases)~1, random=~x,
          data=rainfall, k=3, family=binomial(link=logit))
    toxo.1.3x<- alldist(cbind(Cases,Total-Cases)~x, random=~x, 
          data=rainfall, k=3, family=binomial(link=logit))
    predict(toxo.0.3x, type="response", newdata=data.frame(x=2))
    # [1] 0.4608
    predict(toxo.1.3x, type="response", newdata=data.frame(x=2))
    # [1] 0.4608
    # gives the same result, as both models are equivalent and only differ
    # by a  parameter transformation.

# Fabric faults data:
    data(fabric)
    names(fabric) 
    # [1] "leng" "y"    "x"    
    faults.g2<- alldist(y ~ x, family=poisson(link=log), random=~1, 
        data= fabric,k=2, random.distribution="gq") 
    predict(faults.g2, type="response",newdata=fabric[1:6,])
    # [1]  8.715805 10.354556 13.341242  5.856821 11.407828 13.938013
    # is not the same as
    predict(faults.g2, type="response")[1:6]
    # [1]  6.557786  7.046213 17.020242  7.288989 13.992591  9.533823
    # since in the first case prediction is done using the analytical 
    # mean of the marginal distribution, and in the second case  using the
    # individual posterior probabilities in an  empirical Bayes approach. 





