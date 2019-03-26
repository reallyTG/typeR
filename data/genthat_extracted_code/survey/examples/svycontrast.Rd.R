library(survey)


### Name: svycontrast
### Title: Linear and nonlinearconstrasts of survey statistics
### Aliases: svycontrast
### Keywords: survey

### ** Examples

data(api)
dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)

a <- svytotal(~api00+enroll+api99, dclus1)
svycontrast(a, list(avg=c(0.5,0,0.5), diff=c(1,0,-1)))
## if contrast vectors have names, zeroes may be omitted
svycontrast(a, list(avg=c(api00=0.5,api99=0.5), diff=c(api00=1,api99=-1)))

## nonlinear contrasts
svycontrast(a, quote(api00/api99))
svyratio(~api00, ~api99, dclus1)

## Example: standardised skewness coefficient
moments<-svymean(~I(api00^3)+I(api00^2)+I(api00), dclus1)
svycontrast(moments, 
quote((`I(api00^3)`-3*`I(api00^2)`*`I(api00)`+ 3*`I(api00)`*`I(api00)`^2-`I(api00)`^3)/
      (`I(api00^2)`-`I(api00)`^2)^1.5))

## Example: geometric means

meanlogs <- svymean(~log(api00)+log(api99), dclus1)
svycontrast(meanlogs,
    list(api00=quote(exp(`log(api00)`)), api99=quote(exp(`log(api99)`))))




