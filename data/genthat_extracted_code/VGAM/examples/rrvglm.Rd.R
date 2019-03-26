library(VGAM)


### Name: rrvglm
### Title: Fitting Reduced-Rank Vector Generalized Linear Models (RR-VGLMs)
### Aliases: rrvglm
### Keywords: models regression

### ** Examples

## Not run: 
##D # Example 1: RR negative binomial with Var(Y) = mu + delta1 * mu^delta2
##D nn <- 1000       # Number of observations
##D delta1 <- 3.0    # Specify this
##D delta2 <- 1.5    # Specify this; should be greater than unity
##D a21 <- 2 - delta2
##D mydata <- data.frame(x2 = runif(nn), x3 = runif(nn))
##D mydata <- transform(mydata, mu = exp(2 + 3 * x2 + 0 * x3))
##D mydata <- transform(mydata,
##D                     y2 = rnbinom(nn, mu = mu, size = (1/delta1)*mu^a21))
##D plot(y2 ~ x2, data = mydata, pch = "+", col = 'blue', las = 1,
##D      main = paste("Var(Y) = mu + ", delta1, " * mu^", delta2, sep = ""))
##D rrnb2 <- rrvglm(y2 ~ x2 + x3, negbinomial(zero = NULL),
##D                 data = mydata, trace = TRUE)
##D 
##D a21.hat <- (Coef(rrnb2)@A)["loge(size)", 1]
##D beta11.hat <- Coef(rrnb2)@B1["(Intercept)", "loge(mu)"]
##D beta21.hat <- Coef(rrnb2)@B1["(Intercept)", "loge(size)"]
##D (delta1.hat <- exp(a21.hat * beta11.hat - beta21.hat))
##D (delta2.hat <- 2 - a21.hat)
##D # exp(a21.hat * predict(rrnb2)[1,1] - predict(rrnb2)[1,2])  # delta1.hat
##D summary(rrnb2)
##D 
##D # Obtain a 95 percent confidence interval for delta2:
##D se.a21.hat <- sqrt(vcov(rrnb2)["I(latvar.mat)", "I(latvar.mat)"])
##D ci.a21 <- a21.hat +  c(-1, 1) * 1.96 * se.a21.hat
##D (ci.delta2 <- 2 - rev(ci.a21))  # The 95 percent confidence interval
##D 
##D Confint.rrnb(rrnb2)  # Quick way to get it
##D 
##D # Plot the abundances and fitted values against the latent variable
##D plot(y2 ~ latvar(rrnb2), data = mydata, col = "blue",
##D      xlab = "Latent variable", las = 1)
##D ooo <- order(latvar(rrnb2))
##D lines(fitted(rrnb2)[ooo] ~ latvar(rrnb2)[ooo], col = "orange")
##D 
##D # Example 2: stereotype model (reduced-rank multinomial logit model)
##D data(car.all)
##D scar <- subset(car.all,
##D                is.element(Country, c("Germany", "USA", "Japan", "Korea")))
##D fcols <- c(13,14,18:20,22:26,29:31,33,34,36)  # These are factors
##D scar[, -fcols] <- scale(scar[, -fcols])  # Standardize all numerical vars
##D ones <- matrix(1, 3, 1)
##D clist <- list("(Intercept)" = diag(3), Width = ones, Weight = ones,
##D               Disp. = diag(3), Tank = diag(3), Price = diag(3),
##D               Frt.Leg.Room = diag(3))
##D set.seed(111)
##D fit <- rrvglm(Country ~ Width + Weight + Disp. + Tank +
##D               Price + Frt.Leg.Room,
##D               multinomial, data = scar, Rank = 2, trace = TRUE,
##D               constraints = clist, noRRR = ~ 1 + Width + Weight,
##D               Uncor = TRUE, Corner = FALSE, Bestof = 2)
##D fit@misc$deviance  # A history of the fits
##D Coef(fit)
##D biplot(fit, chull = TRUE, scores = TRUE, clty = 2, Ccex = 2,
##D        ccol = "blue", scol = "orange", Ccol = "darkgreen", Clwd = 2,
##D        main = "1=Germany, 2=Japan, 3=Korea, 4=USA")
## End(Not run)



