library(CAMAN)


### Name: mixcov
### Title: Fitting mixture models with covariates
### Aliases: mixcov
### Keywords: meta-analysis, covariates, mixture model

### ** Examples

### Toy data: simulate subjects with a different relationship between age and salariy
  grps = sample(1:3,70, replace=TRUE) #assign each person to one group 
  salary=NULL
  age = round(runif(70) * 47 + 18)
  #random effects: age has a different influence (slope) on the salary
  salary[grps == 1] = 2000 + 12 * age[grps==1]
  salary[grps == 2] = 4000 + 4 * age[grps==2]
  salary[grps == 3] = 3200 + (-15) * age[grps==3]
  salary = salary + rnorm(70)*30  #some noise
  sex =sample(c("m","w"), 70, replace=TRUE)
  salary[sex=="m"] = salary[sex=="m"] * 1.2 #men earn 20 percent more than women
  salaryData = data.frame(salary=salary, age=age, sex=sex)
  tstSalary <- mixcov(dep="salary", fixed="sex", random="age" ,data=salaryData,
                      k=3,family="gaussian", acc=10^-3)
 

### POISSON data:
data(NoP)
ames3 <- mixcov(dep="count",fixed=c("dose", "logd"),random="",data=NoP,
                k=3,family="poisson")

### Gaussian data
data(betaplasma)
beta4 <- mixcov(dep="betacaro", fixed=c("chol","sex","bmi"), random="betadiet",
                data=betaplasma, k=4, family="gaussian")



