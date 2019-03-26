library(gtheory)


### Name: gstudy
### Title: Conduct a Univariate or Multivariate Generalizability (G) Study
### Aliases: gstudy gstudy.data.frame gstudy.multivariate gstudy.univariate

### ** Examples

#Conduct a univariate G study.
#Compare to results on page 116 of Brennan (2001).
data(Brennan.3.2)
formula.Brennan.3.2 <- "Score ~ (1 | Person) + (1 | Task) + 
  (1 | Rater:Task) + (1 | Person:Task)"
gstudy(data = Brennan.3.2, formula = formula.Brennan.3.2)

#Conduct a multivariate G study.
#Compare to results on page 270 of Brennan (2001).
data(Rajaratnam.2)
formula.Rajaratnam.2 <- "Score ~ (1 | Person) + (1 | Item)"
gstudy(data = Rajaratnam.2, formula = formula.Rajaratnam.2, colname.strata = "Subtest", 
  colname.objects = "Person")



