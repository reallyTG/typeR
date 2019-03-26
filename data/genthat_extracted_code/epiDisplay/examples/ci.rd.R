library(epiDisplay)


### Name: CI
### Title: Confidence interval of probabilty, mean and incidence
### Aliases: ci ci.default ci.binomial ci.numeric ci.poisson
### Keywords: database

### ** Examples

data(Oswego)
.data <- Oswego
attach(.data)
# logical variable
ci(ill)
# numeric variable
ci(age)
# factor
ci(sex=="M")
ci(sex=="F")
detach(.data)

# Example of confidence interval for means
library(MASS)
.data <- Cars93
attach(.data)
car.price <- aggregate(Price, by=list(type=Type), FUN=c("mean","length","sd"))
car.price
ci.numeric(x=car.price$mean, n=car.price$length, sds=car.price$sd.Price )
detach(.data)
rm(list=ls())
 
# Example of confidence interval for probabilty
data(ANCdata)
.data <- ANCdata
attach(.data)
death1 <- death=="yes"
death.by.group <- aggregate.numeric(death1, 
	by=list(anc=anc, clinic=clinic), FUN=c("sum","length"))
death.by.group
ci.binomial(death.by.group$sum.death1, death.by.group$length)
detach(.data)
rm(list=ls())

# Example of confidence interval for incidence
data(Montana)
.data <- Montana
attach(.data)
des(.data)
age.Montana <- aggregate.data.frame(Montana[,1:2],
	by=list(agegr=Montana$agegr),FUN="sum")
age.Montana
ci.poisson(age.Montana$respdeath, person.time=age.Montana$personyrs)
detach(.data)
rm(list=ls())

# Keyboard input
# What is the 95 % CI of sensitivity of a test that gives all
# positive results among 40 diseased individuals
ci.binomial(40,40)

# What is the 99 % CI of incidence of a disease if the number
# of cases is 25 among 340,000 person-years
ci.poisson(25, 340000, alpha=.01) # 4.1 to 12.0 per 100,000 person-years




