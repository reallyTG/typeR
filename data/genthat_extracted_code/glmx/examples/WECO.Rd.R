library(glmx)


### Name: WECO
### Title: Productivity and Quit Behavior of Western Electric Workers
### Aliases: WECO
### Keywords: datasets

### ** Examples

## No test: 
## WECO data
data("WECO", package = "glmx")
f <- kwit ~ sex + dex + poly(lex, 2, raw = TRUE)
## (raw = FALSE would be numerically more stable)

## Gosset model
gossbin <- function(nu) binomial(link = gosset(nu))
m1 <- glmx(f, data = WECO,
  family = gossbin, xstart = 0, xlink = "log")

## Pregibon model
pregibin <- function(shape) binomial(link = pregibon(shape[1], shape[2]))
m2 <- glmx(f, data = WECO,
  family = pregibin, xstart = c(0, 0), xlink = "identity")

## Probit/logit/cauchit models
m3 <- lapply(c("probit", "logit", "cauchit"), function(nam)
  glm(f, data = WECO, family = binomial(link = nam)))

## Probit/cauchit vs. Gosset
if(require("lmtest")) {
lrtest(m3[[1]], m1)
lrtest(m3[[3]], m1)

## Logit vs. Pregibon
lrtest(m3[[2]], m2)
}

## Table 1
tab1 <- sapply(c(m3, list(m1)), function(obj)
  c(head(coef(obj), 5), AIC(obj)))
colnames(tab1) <- c("Probit", "Logit", "Cauchit", "Gosset")
rownames(tab1)[4:6] <- c("lex", "lex^2", "AIC")
tab1 <- round(t(tab1), digits = 3)
tab1

## Figure 4
plot(fitted(m3[[1]]), fitted(m1),
  xlim = c(0, 1), ylim = c(0, 1),
  xlab = "Estimated Probit Probabilities",
  ylab = "Estimated Gosset Probabilities")
abline(0, 1)
## End(No test)



