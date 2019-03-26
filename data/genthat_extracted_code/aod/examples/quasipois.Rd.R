library(aod)


### Name: quasipois
### Title: Quasi-Likelihood Model for Counts
### Aliases: quasipois
### Keywords: regression

### ** Examples

  # without offset
  data(salmonella)
  quasipois(y ~ log(dose + 10) + dose,
            data = salmonella)
  quasipois(y ~ log(dose + 10) + dose, 
            data = salmonella, phi = 0.07180449)
  summary(glm(y ~ log(dose + 10) + dose,
          family = poisson, data = salmonella))
  quasipois(y ~ log(dose + 10) + dose,
          data = salmonella, phi = 0)
  # with offset
  data(cohorts)
  i <- cohorts$age ; levels(i) <- 1:7
  j <- cohorts$period ; levels(j) <- 1:7
  i <- as.numeric(i); j <- as.numeric(j)
  cohorts$cohort <- j + max(i) - i
  cohorts$cohort <- as.factor(1850 + 5 * cohorts$cohort)
  fm1 <- quasipois(y ~ age + period + cohort + offset(log(n)),
                   data = cohorts)
  fm1
  quasipois(y ~ age + cohort + offset(log(n)),
            data = cohorts, phi = fm1@phi)
  


