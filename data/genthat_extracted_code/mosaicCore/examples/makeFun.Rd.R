library(mosaicCore)


### Name: makeFun
### Title: Create a function from a formula
### Aliases: makeFun makeFun.function makeFun.formula makeFun.lm
###   makeFun.glm makeFun.nls

### ** Examples

f <- makeFun( sin(x^2 * b) ~ x & y & a); f
g <- makeFun( sin(x^2 * b) ~ x & y & a, a = 2 ); g
h <- makeFun( a * sin(x^2 * b) ~ b & y, a = 2, y = 3); h
if (require(mosaicData)) {
  model <- lm( log(length) ~ log(width), data = KidsFeet)
  f <- makeFun(model, transformation = exp)
  f(8.4)
  head(KidsFeet, 1)
}

if (require(mosaicData)) {
  model <- lm(wage ~ poly(exper, degree = 2), data = CPS85)
  fit <- makeFun(model)
  if (require(ggformula)) {
    gf_point(wage ~ exper, data = CPS85) %>%
    gf_fun(fit(exper) ~ exper, color = "red")
  }
}
if (require(mosaicData)) {
model <- glm(wage ~ poly(exper, degree = 2), data = CPS85, family = gaussian)
fit <- makeFun(model)
  if (require(ggformula)) {
    gf_jitter(wage ~ exper, data = CPS85) %>%
    gf_fun(fit(exper) ~ exper, color = "red")
    gf_jitter(wage ~ exper, data = CPS85) %>%
    gf_function(fun = fit, color = "blue")
  }
}
if (require(mosaicData)) {
model <- nls( wage ~ A + B * exper + C * exper^2, data = CPS85, start = list(A = 1, B = 1, C = 1) )
fit <- makeFun(model)
  if (require(ggformula)) {
    gf_point(wage ~ exper, data = CPS85) %>%
    gf_fun(fit(exper) ~ exper, color = "red")
  }
}




