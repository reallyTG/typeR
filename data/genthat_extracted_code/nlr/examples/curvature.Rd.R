library(nlr)


### Name: curvature
### Title: Calculate (IE) Intrinsic curvature and (PE) Parameter curvature.
### Aliases: curvature
### Keywords: Curvature

### ** Examples

 crbdt<-list(xr=nlr::carbon$year,yr=nlr::carbon$co2)
 ScalExp<- convexpr2nlform(yr ~ p1 + exp(-(p2 - p3 * xr)),
                        selfStart=function(data){
                            y1 <-as.double(data$yr)
                            p1<-min(y1)
                            y<-log(y1-p1+10*.Machine$double.eps)
                            x<-as.double(data$xr)
                            b1<-lm(y~x)
                            p2<- -b1$coefficients[1]
                            p3<- b1$coefficients[2]
                            return(list(p1=p1,p2=p2,p3=p3))
                        },
                        name="Scaled Exp convex",
                        start=list(p1=700,p2=21,p3=0.01)
)
 carbon.ols <- nlr(formula=ScalExp, data=crbdt, 
                  control=nlr.control(method="OLS"))
carbon.ols$curvature                  



