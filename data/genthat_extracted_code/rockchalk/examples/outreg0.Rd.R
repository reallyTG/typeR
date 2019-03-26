library(rockchalk)


### Name: outreg0
### Title: Creates a publication quality result table for regression
###   models. outreg0 is the last version in the last development stream.
### Aliases: outreg0
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

outreg0(list("Model 1" = m1), title = "My One Tightly Printed Regression")

outreg0(list("Model 1" = m1), title = "My One Tightly Printed Regression in a
Float", float = TRUE, label = "outreg1")

outreg0(list("Fingers" = m1), tight = FALSE, title = "My Only
Spread Out Regression", float = TRUE, alpha = c(0.05, 0.01,
0.001))

outreg0(list(ModelA = m1, "Model B label with Spaces" = m2),
      varLabels = list(x1 = "Billie"),
      title = "My Two Linear Regressions",
      request = c(fstatistic = "F"))

outreg0(list(ModelA = m1, ModelB = m2),
    modelLabels = c("Overrides ModelA", "Overrides ModelB"),
    varLabels = list(x1 = "Billie"),
    title = "Note modelLabels Overrides model names")

outreg0(list(m1, m2), modelLabels = c("Whatever", "Whichever"),
    title = "Still have showAIC argument, as in previous versions",
    showAIC = TRUE, float = TRUE)

outreg0(list(m1, m2), modelLabels = c("Whatever", "Whichever"),
    title = "Another way to get AIC output",
    runFuns = c("AIC" = "Akaike IC"))

outreg0(list("Amod" = m1, "Bmod" = m2, "Gmod" = m3),
    title = "My Three Linear Regressions", float = FALSE)

outreg0(list(m1, m2, m3), tight = FALSE,
    modelLabels = c("I Love really long titles", "Hate Long", "Medium"),
    float = FALSE)

outreg0(list(gm1), modelLabels = c("GLM"), float = TRUE)

outreg0(list(m1, gm1), modelLabels = c("OLS", "GLM"),
    float = TRUE, alpha = c(0.05, 0.01))

outreg0(list(OLS = m1, GLM = gm1), float = TRUE,
    request = c(fstatistic = "F"), runFuns = c("BIC" = "BIC"))

outreg0(list(OLS = m1, GLM = gm1), float = TRUE,
    request = c(fstatistic = "F"), runFuns = c("BIC" = "BIC"),
    digits = 5, alpha = 0.01)

outreg0(list("OLS 1" = m1, "OLS 2" = m2,  GLM = gm1), float = TRUE,
    request = c(fstatistic = "F"),
    runFuns = c("BIC" = "BIC", logLik = "ll"),
    digits = 5, alpha = c(0.05, 0.01, 0.001))

outreg0(list(ModelA = gm1, "Model B label with Spaces" = m2),
    request = c(fstatistic = "F"),
    runFuns = c("BIC" = "Schwarz IC", "AIC" = "Akaike IC",
         "nobs" = "N Again?"))



