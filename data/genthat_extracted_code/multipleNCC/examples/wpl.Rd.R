library(multipleNCC)


### Name: wpl
### Title: Weighted partial likelihood for nested case-control data
### Aliases: wpl

### ** Examples

data(CVD_Accidents)
wpl(Surv(agestart,agestop,dead24)~factor(smoking3gr)+bmi+factor(sex),data=CVD_Accidents,
samplestat=CVD_Accidents$samplestat,weight.method="gam")

wpl(Surv(agestart,agestop,dead24)~factor(smoking3gr)+bmi+factor(sex),data=CVD_Accidents,
samplestat=CVD_Accidents$samplestat,m=1,match.var=cbind(CVD_Accidents$sex,
CVD_Accidents$bmi),match.int=c(0,0,-2,2),weight.method="glm")


## The function is currently defined as
function (x, data, samplestat, m = 1, weight.method = "KM", no.intervals = 10, 
    variance = "robust", no.intervals.left = c(3, 4), match.var = 0, 
    match.int = 0) 
{
    UseMethod("wpl")
  }



