library(glarma)


### Name: RobberyConvict
### Title: Court Convictions for Armed Robbery in New South Wales
### Aliases: RobberyConvict
### Keywords: datasets

### ** Examples

### Example with Robbery Convictions
data(RobberyConvict)
datalen <- dim(RobberyConvict)[1]
monthmat <- matrix(0, nrow = datalen, ncol = 12)
dimnames(monthmat) <- list(NULL, c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                   "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
months <- unique(months(strptime(RobberyConvict$Date, format = "%m/%d/%Y"),
                        abbreviate=TRUE))


for (j in 1:12) {
  monthmat[months(strptime(RobberyConvict$Date,  "%m/%d/%Y"),
                  abbreviate = TRUE) == months[j], j] <-1
}

RobberyConvict <- cbind(rep(1, datalen), RobberyConvict, monthmat)
rm(monthmat)

## LOWER COURT ROBBERY
y1 <- RobberyConvict$LC.Y
n1 <- RobberyConvict$LC.N

Y <- cbind(y1, n1-y1)

glm.LCRobbery <- glm(Y ~ Step.2001 +
                        I(Feb + Mar + Apr + May + Jun + Jul) +
                        I(Aug + Sep + Oct + Nov + Dec),
                     data = RobberyConvict, family = binomial(link = logit),
                     na.action = na.omit, x = TRUE)

summary(glm.LCRobbery, corr = FALSE)

X <- glm.LCRobbery$x


## Newton Raphson
glarmamod <- glarma(Y, X, phiLags = c(1), type = "Bin", method = "NR",
                    residuals = "Pearson", maxit = 100, grad = 1e-6)
glarmamod
summary(glarmamod)

## LRT, Wald tests.
likTests(glarmamod)

## Residuals and Fit Plots
plot.glarma(glarmamod)


## HIGHER COURT ROBBERY
y1 <- RobberyConvict$HC.Y
n1 <- RobberyConvict$HC.N

Y <- cbind(y1, n1-y1)

glm.HCRobbery <- glm(Y ~ Trend + Trend.2001 +
                       I(Feb + Mar + Apr + May + Jun) + Dec,
                     data = RobberyConvict, family = binomial(link = logit),
                     na.action = na.omit, x = TRUE)

summary(glm.HCRobbery,corr = FALSE)

X <- glm.HCRobbery$x


## Newton Raphson
glarmamod <- glarma(Y, X, phiLags = c(1, 2, 3), type = "Bin", method = "NR",
                    residuals = "Pearson", maxit = 100, grad = 1e-6)
glarmamod
summary(glarmamod)


## LRT, Wald tests.
likTests(glarmamod)

## Residuals and Fit Plots
plot.glarma(glarmamod)



