library(rockchalk)


### Name: outreg
### Title: Creates a publication quality result table for regression
###   models. Works with models fitted with lm, glm, as well as lme4.
### Aliases: outreg
### Keywords: regression

### ** Examples

set.seed(2134234)
dat <- data.frame(x1 = rnorm(100), x2 = rnorm(100))
dat$y1 <- 30 + 5 * rnorm(100) + 3 * dat$x1 + 4 * dat$x2
dat$y2 <- rnorm(100) + 5 * dat$x2
m1 <- lm(y1 ~ x1, data = dat)
m2 <- lm(y1 ~ x2, data = dat)
m3 <- lm(y1 ~ x1 + x2, data = dat)
gm1 <- glm(y1 ~ x1, family = Gamma, data = dat)
outreg(m1, title = "My One Tightly Printed Regression", float = TRUE)
ex1 <- outreg(m1, title = "My One Tightly Printed Regression",
               float = TRUE, print.results = FALSE, centering = "siunitx")
## Show markup, Save to file with cat()
cat(ex1)
## cat(ex1, file = "ex1.tex")
 
ex2 <- outreg(list("Fingers" = m1), tight = FALSE, 
    title = "My Only Spread Out Regressions", float = TRUE,
    alpha = c(0.05, 0.01, 0.001)) 

ex3 <- outreg(list("Model A" = m1, "Model B label with Spaces" = m2),
    varLabels = list(x1 = "Billie"), 
    title = "My Two Linear Regressions", request = c(fstatistic = "F"),
    print.results = TRUE)
cat(ex3)

ex4 <- outreg(list("Model A" = m1, "Model B" = m2),
    modelLabels = c("Overrides ModelA", "Overrides ModelB"),
    varLabels = list(x1 = "Billie"),
    title = "Note modelLabels Overrides model names")
cat(ex4)

ex5 <- outreg(list("Whichever" = m1, "Whatever" = m2),
    title = "Still have showAIC argument, as in previous versions",
    showAIC = TRUE, float = TRUE, centering = "siunitx")

ex5s <- outreg(list("Whichever" = m1, "Whatever" = m2),
    title = "Still have showAIC argument, as in previous versions",
    showAIC = TRUE, float = TRUE, centering = "siunitx")

## No test: 
## Launches HTML browse
ex5html <- outreg(list("Whichever" = m1, "Whatever" = m2),
    title = "Still have showAIC argument, as in previous versions",
    showAIC = TRUE, type = "html")
## Could instead, make a file:
## fn <- "some_name_you_choose.html"
## cat(ex5html, file = fn)
## browseURL(fn)
## Open that HTML file in LibreOffice or MS Word
## End(No test)

ex6 <- outreg(list("Whatever" = m1, "Whatever" =m2),
    title = "Another way to get AIC output",
    runFuns = c("AIC" = "Akaike IC"))
cat(ex6)

ex7 <- outreg(list("Amod" = m1, "Bmod" = m2, "Gmod" = m3),
       title = "My Three Linear Regressions", float = FALSE)
cat(ex7)

## A new feature in 1.85 is ability to provide vectors of beta estimates
## standard errors, and p values if desired. 
## Suppose you have robust standard errors!
if (require(car)){
   newSE <- sqrt(diag(car::hccm(m3)))
   ex8 <- outreg(list("Model A" = m1, "Model B" = m2, "Model C" = m3, "Model C w Robust SE" = m3),
        SElist= list("Model C w Robust SE" = newSE))
   cat(ex8)
}

ex11 <- outreg(list("I Love Long Titles" = m1,
          "Prefer Brevity" = m2,
          "Short" = m3), tight = FALSE, float = FALSE)
cat(ex11)

ex12 <- outreg(list("GLM" = gm1), float = TRUE)
cat(ex12)

ex13 <- outreg(list("OLS" = m1, "GLM" = gm1), float = TRUE,
        alpha = c(0.05, 0.01))
cat(ex13)

ex14 <- outreg(list(OLS = m1, GLM = gm1), float = TRUE,
    request = c(fstatistic = "F"), runFuns = c("BIC" = "BIC"))
cat(ex14)

ex15 <- outreg(list(OLS = m1, GLM = gm1), float = TRUE,
    request = c(fstatistic = "F"), runFuns = c("BIC" = "BIC"),
    digits = 5, alpha = c(0.01))

ex16 <- outreg(list("OLS 1" = m1, "OLS 2" = m2,  GLM = gm1), float = TRUE,
    request = c(fstatistic = "F"),
    runFuns = c("BIC" = "BIC", logLik = "ll"),
    digits = 5, alpha = c(0.05, 0.01, 0.001))

ex17 <- outreg(list("Model A" = gm1, "Model B label with Spaces" = m2),
    request = c(fstatistic = "F"),
    runFuns = c("BIC" = "Schwarz IC", "AIC" = "Akaike IC",
    "nobs" = "N Again?"))

## Here's a fit example from lme4.
if (require(lme4) && require(car)){
  fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
  ex18 <- outreg(fm1)
  cat(ex18)
  ## Fit same with lm for comparison
  lm1 <- lm(Reaction ~ Days, sleepstudy)
  ## Get robust standard errors
  lm1rse <- sqrt(diag(car::hccm(lm1)))

  if(interactive()){
  ex19 <- outreg(list("Random Effects" = fm1, 
       "OLS" = lm1, "OLS Robust SE" = lm1),
       SElist = list("OLS Robust SE" = lm1rse), type = "html")
  }
  ## From the glmer examples
  gm2 <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
                   data = cbpp, family = binomial)
  lm2 <- lm(incidence/size ~ period,  data = cbpp)
  lm2rse <- sqrt(diag(car::hccm(lm2)))
  ## Lets see what MASS::rlm objects do? Mostly OK
  rlm2 <- MASS::rlm(incidence/size ~ period, data = cbpp)
  ## No test: 
  ex20 <- outreg(list("GLMER" = gm2, "lm" = lm2, "lm w/robust se" = lm2,
            "rlm" = rlm2), SElist = list("lm w/robust se" = lm2rse),
            type = "html")
  
## End(No test) 
}



