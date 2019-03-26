library(gtheory)


### Name: dstudy
### Title: Conduct a Univariate or Multivariate Decision (D) Study
### Aliases: dstudy dstudy.components dstudy.dstudy dstudy.gstudy

### ** Examples

#A univariate D study.
#Compare to results on page 116 of Brennan (2001).
data(Brennan.3.2)
formula.Brennan.3.2 <- "Score ~ (1 | Person) + (1 | Task) + (1 | Rater:Task) + 
  (1 | Person:Task)"
gstudy.out <- gstudy(data = Brennan.3.2, formula = formula.Brennan.3.2)
dstudy(gstudy.out, colname.objects = "Person", data = Brennan.3.2, colname.scores = "Score")

#A multivariate D study.
#Compare to results on pages 270-272 of Brennan (2001).
data(Rajaratnam.2)
formula.Rajaratnam.2 <- "Score ~ (1 | Person) + (1 | Item)"
gstudy.out <- gstudy(data = Rajaratnam.2, formula = formula.Rajaratnam.2, 
  colname.strata = "Subtest", colname.objects = "Person")
dstudy(gstudy.out, colname.objects = "Person", data = Rajaratnam.2, colname.scores = "Score", 
  colname.strata = "Subtest", weights = c(0.25, 0.5, 0.25))



