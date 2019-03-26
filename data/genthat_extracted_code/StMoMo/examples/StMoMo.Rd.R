library(StMoMo)


### Name: StMoMo
### Title: Create a new Stochastic Mortality Model
### Aliases: StMoMo StMoMo StMoMo-package

### ** Examples

#Lee-Carter model
constLC <- function(ax, bx, kt, b0x, gc, wxt, ages) {
 c1 <- mean(kt[1, ], na.rm = TRUE)
 c2 <- sum(bx[, 1], na.rm = TRUE)
 list(ax = ax + c1 * bx, bx = bx / c2, kt = c2 * (kt - c1))
}
LC <- StMoMo(link = "log", staticAgeFun = TRUE, periodAgeFun = "NP",
             constFun = constLC)

plot(fit(LC, data = EWMaleData, ages.fit = 55:89))


#CBD model   
f2 <- function(x, ages) x - mean(ages)
CBD <- StMoMo(link = "logit", staticAgeFun = FALSE,
              periodAgeFun = c("1", f2))
plot(fit(CBD, data = EWMaleData, ages.fit = 55:89))

#Reduced Plat model (Plat, 2009)
f2 <- function(x, ages) mean(ages) - x
constPlat <- function(ax, bx, kt, b0x, gc, wxt, ages) {
 nYears <- dim(wxt)[2]
 x <- ages
 t <- 1:nYears
 c <- (1 - tail(ages, 1)):(nYears - ages[1])
 xbar <- mean(x)
 #nsum g(c)=0, nsum cg(c)=0, nsum c^2g(c)=0
 phiReg <- lm(gc ~ 1 + c + I(c^2), na.action = na.omit)
 phi <- coef(phiReg)
 gc <- gc - phi[1] - phi[2] * c - phi[3] * c^2
 kt[2, ] <- kt[2, ] + 2 * phi[3] * t
 kt[1, ] <- kt[1, ] + phi[2] * t + phi[3] * (t^2 - 2 * xbar * t)
 ax <- ax + phi[1] - phi[2] * x + phi[3] * x^2
 #nsum kt[i, ] = 0
 ci <- rowMeans(kt, na.rm = TRUE)
 ax <- ax + ci[1] + ci[2] * (xbar - x)
 kt[1, ] <- kt[1, ] - ci[1]
 kt[2, ] <- kt[2, ] - ci[2]
 list(ax = ax, bx = bx, kt = kt, b0x = b0x, gc = gc)
}
PLAT <- StMoMo(link = "log", staticAgeFun = TRUE,
               periodAgeFun = c("1", f2), cohortAgeFun = "1",
               constFun = constPlat)

plot(fit(PLAT, data = EWMaleData, ages.fit = 55:89))

#Models not supported
## Not run: 
##D MnotSup1 <- StMoMo(periodAgeFun = c(f2, "NP"))
##D MnotSup1 <- StMoMo(periodAgeFun = f2, cohortAgeFun = "NP")
## End(Not run)



