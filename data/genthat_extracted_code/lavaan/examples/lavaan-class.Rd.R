library(lavaan)


### Name: lavaan-class
### Title: Class For Representing A (Fitted) Latent Variable Model
### Aliases: lavaan-class coef,lavaan-method vcov,lavaan-method
###   anova,lavaan-method predict,lavaan-method resid,lavaan-method
###   residuals,lavaan-method fitted,lavaan-method
###   fitted.values,lavaan-method nobs nobs,lavaan-method
###   logLik,lavaan-method update,lavaan-method show,lavaan-method
###   summary,lavaan-method

### ** Examples

HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data=HolzingerSwineford1939)

summary(fit, standardized=TRUE, fit.measures=TRUE, rsquare=TRUE)
fitted(fit)
coef(fit)
resid(fit, type="normalized")



