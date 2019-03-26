library(PSAgraphics)


### Name: circ.psa
### Title: Generates a Propensity Score Assessment Plot
### Aliases: circ.psa
### Keywords: hplot

### ** Examples

##Random data with effect size 0
response <- rnorm(1000)
treatment <- sample(c(0,1), 1000, replace = TRUE)
strata <- sample(1:6, 1000, replace = TRUE)
circ.psa(response, treatment, strata)

##Random data with effect size -.2
response <- c(rnorm(500, 0, 12), rnorm(500, 6, 12))
treatment <- c(rep(0, 500), rep(1,500))
strata <- sample(1:5, 1000, replace = TRUE)
aaa <- cbind(response, treatment, strata)
circ.psa(aaa)

##Random data with effect size -2
response <- c(rt(100,3) * 2 + 20, rt(100,12) * 2 + 18)
treatment <- rep(c("A","B"), each = 100)
strata <- sample(c("X","Y","Z","U","V"), 200, replace = TRUE)
circ.psa(response, treatment, strata)

##Tree derived strata
library(rpart)
data(lindner)
attach(lindner)
lindner.rpart <- rpart(abcix ~ stent + height + female + diabetic +
     acutemi + ejecfrac + ves1proc, data = lindner, method = "class")
lindner.tree<-factor(lindner.rpart$where, labels = 1:6)
circ.psa(log(cardbill), abcix, lindner.tree)

##Loess derived strata
lindner.ps <- glm(abcix ~ stent + height + female + 
      diabetic + acutemi + ejecfrac + ves1proc, 
      data = lindner, family = binomial)
ps<-lindner.ps$fitted
lindner.loess<-loess.psa(log(cardbill), abcix, ps)
circ.psa(lindner.loess$summary.strata[, 1:4], summary = TRUE, 
      inc = .1, labcex = .7)


