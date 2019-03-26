library(drc)


### Name: S.capricornutum
### Title: Effect of cadmium on growth of green alga
### Aliases: S.capricornutum
### Keywords: datasets

### ** Examples


## Fitting 3-parameter log-normal model
s.cap.m1 <- drm(count ~ conc, data = S.capricornutum, fct = LN.3())

## Residual plot
plot(fitted(s.cap.m1), residuals(s.cap.m1))

## Fitting model with transform-both-sides approach
s.cap.m2 <- boxcox(s.cap.m1, method = "anova")
summary(s.cap.m2)

## Residual plot after transformation (looks better)
plot(fitted(s.cap.m2), residuals(s.cap.m2))

## Calculating ED values on log scale
ED(s.cap.m2, c(10, 20, 50), interval="delta")

## Fitting model with ED50 as parameter
## (for comparison)
s.cap.m3 <- drm(count ~ conc, data = S.capricornutum, fct = LN.3(loge=TRUE))
s.cap.m4 <- boxcox(s.cap.m3, method = "anova")
summary(s.cap.m4)
ED(s.cap.m4, c(10, 20, 50), interval = "fls")




