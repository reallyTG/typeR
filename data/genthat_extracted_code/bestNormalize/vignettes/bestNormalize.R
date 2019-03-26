## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.height = 5, fig.width = 7)
library(bestNormalize)

## ----orq_vis, echo = FALSE-----------------------------------------------

x <- iris$Petal.Width
on <- orderNorm(x, warn = FALSE)
xx <- seq(min(x) - 1, max(x) + 1, length = 1000)
yy <- suppressWarnings(predict(on, xx))
r <- ((rank(x) + .5) / (length(x) + 1))
f  <- suppressWarnings(glm(r ~ x, family = "binomial"))
p <- qnorm(predict(f, newdata = data.frame(x = xx), type = 'response'))

plot(x, on$x.t, pch = 20, xlim = range(xx), ylim = range(p, yy), main = "ORQ transformation",
      xlab = "Original Value", ylab = "Transformed Value")
lines(xx, p, col = '1', lwd = 1, lty =2)
lines(xx, yy, col = 'slateblue', lwd = 2)

# Add legend
legend('bottomright', 
       c('Original data', 'Tranformed values for new data', 
         'Approximation for Extrapolation'), 
       bty = 'n', lty = c(0, 1, 2), lwd = c(0, 2,1), 
       pch = c(20, NA, NA), 
       col = c(1, "slateblue", 1, 1))

## ----par_vis, echo = FALSE, out.width = "75%"----------------------------
knitr::include_graphics("parallel_timings.jpg")

## ----gen_data------------------------------------------------------------

# Generate some data
set.seed(100)
x <- rgamma(250, 1, 1)
MASS::truehist(x, nbins = 12)

## ----vis_code------------------------------------------------------------
# Perform some tranformations individually

# arcsinh transformation
(arcsinh_obj <- arcsinh_x(x))
# Box Cox's Transformation
(boxcox_obj <- boxcox(x))
# Yeo-Johnson's Transformation
(yeojohnson_obj <- yeojohnson(x))
# orderNorm Transformation
(orderNorm_obj <- orderNorm(x))

# Pick the best one automatically
(BNobject <- bestNormalize(x))

# Last resort - binarize
(binarize_obj <- binarize(x))


## ----vis_data------------------------------------------------------------
xx <- seq(min(x), max(x), length = 100)
plot(xx, predict(arcsinh_obj, newdata = xx), type = "l", col = 1, ylim = c(-4, 4),
     xlab = 'x', ylab = "g(x)")
lines(xx, predict(boxcox_obj, newdata = xx), col = 2)
lines(xx, predict(yeojohnson_obj, newdata = xx), col = 3)
lines(xx, predict(orderNorm_obj, newdata = xx), col = 4)

legend("bottomright", legend = c("arcsinh", "Box Cox", "Yeo-Johnson", "OrderNorm"), 
       col = 1:4, lty = 1, bty = 'n')

## ----hist_trans, fig.height=8, fig.width = 7-----------------------------
par(mfrow = c(2,2))
MASS::truehist(arcsinh_obj$x.t, main = "Arcsinh transformation", nbins = 12)
MASS::truehist(boxcox_obj$x.t, main = "Box Cox transformation", nbins = 12)
MASS::truehist(yeojohnson_obj$x.t, main = "Yeo-Johnson transformation", nbins = 12)
MASS::truehist(orderNorm_obj$x.t, main = "orderNorm transformation", nbins = 12)

## ----hist_best-----------------------------------------------------------
par(mfrow = c(1,2))
MASS::truehist(BNobject$x.t, 
               main = paste("Best Transformation:", 
                            class(BNobject$chosen_transform)[1]), nbins = 12)
plot(xx, predict(BNobject, newdata = xx), type = "l", col = 1, 
     main = "Best Normalizing transformation", ylab = "g(x)", xlab = "x")

## ----boxplot, fig.width=10, out.width="100%"-----------------------------
boxplot(log10(BNobject$oos_preds), yaxt = 'n')
axis(2, at=log10(c(.1,.5, 1, 2, 5, 10)), labels=c(.1,.5, 1, 2, 5, 10))

## ----bn_output-----------------------------------------------------------
bestNormalize(x, allow_orderNorm = FALSE, out_of_sample = FALSE)

## ----load_appdata--------------------------------------------------------
data("autotrader")
autotrader$yearsold <- 2017 - autotrader$Year
### Using best-normalize
(priceBN <- bestNormalize(autotrader$price, r = 1, k = 5, warn = F))

## ----bn_mileage----------------------------------------------------------
(mileageBN <- bestNormalize(autotrader$mileage, r = 1, k = 5, warn = F))

## ----bn_yearsold---------------------------------------------------------
(yearsoldBN <- bestNormalize(autotrader$yearsold, r = 1, k = 5, warn = F))

## ----hist_app, fig.height=8, fig.width=7---------------------------------
par(mfrow = c(3, 2))
MASS::truehist(autotrader$price)
MASS::truehist(priceBN$x.t)
MASS::truehist(autotrader$mileage)
MASS::truehist(mileageBN$x.t)
MASS::truehist(autotrader$yearsold)
MASS::truehist(yearsoldBN$x.t)

## ----hist_app2-----------------------------------------------------------
par(mfrow = c(2, 2))
price.xx <- seq(min(autotrader$price), max(autotrader$price), length = 100)
mileage.xx <- seq(min(autotrader$mileage), max(autotrader$mileage), length = 100)
yearsold.xx <- seq(min(autotrader$yearsold), max(autotrader$yearsold), length = 100)

plot(price.xx, predict(priceBN, newdata = price.xx), type = "l", 
     main = "Price bestNormalizing transformation", 
     xlab = "Price ($)", ylab = "g(price)")
plot(mileage.xx, predict(mileageBN, newdata = mileage.xx), type = "l", 
     main = "Mileage bestNormalizing transformation", 
     xlab = "Mileage", ylab = "g(Mileage)")
plot(yearsold.xx, predict(yearsoldBN, newdata = yearsold.xx), type = "l", 
     main = "Years-old bestNormalizing transformation", 
     xlab = "Years-old", ylab = "g(Years-old)")

## ----app_vis-------------------------------------------------------------
autotrader$price.t <- priceBN$x.t
autotrader$mileage.t <- mileageBN$x.t
autotrader$yearsold.t <- yearsoldBN$x.t

fit4 <- lm(price.t ~ mileage.t + yearsold.t,
           data = autotrader)
summary(fit4)

miles.t <- predict(mileageBN, newdata = mileage.xx)
c1 <- coef(fit4)["mileage.t"]

par(mfrow = c(1, 1))
plot(
    mileageBN$x.t,
    priceBN$x.t,
    pch = 16,
    col = grey(.1, alpha = .2),
    main = "Estimated linear effect (using transformed data)",
    xlab = "g(Mileage)",
    ylab = "g(Price)"
)
lines(miles.t,
      coef(fit4)[1] + c1 * miles.t,
      col = "slateblue",
      lwd = 2)

## Mileage effect
plot(
  autotrader$mileage,
  autotrader$price,
  pch = 16,
  col = grey(.1, alpha = .2),
  main = "Mileage effect (re-transformed to original unit)",
  xlab = "Mileage",
  ylab = "Price"
)
line_vals <- miles.t * c1 + coef(fit4)[1]
lines(
    mileage.xx,
    y = predict(priceBN, newdata = line_vals, inverse = TRUE),
    lwd = 2,
    col = "slateblue"
)
# Compare to GAM fit
fit_gam <- mgcv::gam(price ~ s(yearsold) + s(mileage), data = autotrader)
p_gam <- predict(fit_gam, newdata = data.frame(yearsold = mean(autotrader$yearsold), 
                                               mileage = mileage.xx))
lines(mileage.xx, p_gam, lwd = 2, col = 'green3')

legend(
  'topright',
  c("GAM fit", "Transformed linear fit"),
  lwd = 2,
  col = c("green3", "slateblue"),
  bty = "n"
  )

## Years Old effect
yo.t <- predict(yearsoldBN, newdata = yearsold.xx)
c2 <- coef(fit4)["yearsold.t"]

plot(
    jitter(autotrader$yearsold, 1.5),
    autotrader$price,
    pch = 16,
    col = grey(.1, alpha = .2), 
    main = "Years old effect (re-transformed to original unit)",
    xlab = "Age (Jittered)",
    ylab = "Price"
)
line_vals <- yo.t * c2 + coef(fit4)[1]
lines(
    yearsold.xx,
    y = predict(priceBN, newdata = line_vals, inverse = TRUE),
    lwd = 2,
    col = "slateblue"
)

# Compare to GAM fit
p_gam <- predict(fit_gam, newdata = data.frame(yearsold = yearsold.xx, 
                                               mileage = mean(autotrader$mileage)))
lines(yearsold.xx, p_gam, lwd = 2, col = 'green3')

legend(
  'topright',
  c("GAM fit", "Transformed linear fit"),
  lwd = 2,
  col = c("green3", "slateblue"),
  bty = "n"
  )

