## ----opts, echo = FALSE, results = "hide"--------------------------------
library("knitr")
opts_knit$set(progress = TRUE, verbose = TRUE)
opts_chunk$set(echo = FALSE, results = "hide", dev = "cairo_pdf", fig.height=7, fig.width=11, out.width='\\textwidth')

## ----model1, results = "asis"--------------------------------------------
library("gapminder")
suppressPackageStartupMessages(library("stargazer"))
gapminder[["pop"]] <- gapminder[["pop"]]/1e6
gapminder[["loggdp"]] <- log(gapminder[["gdpPercap"]])
m1 <- lm(pop ~ loggdp + lifeExp, data = gapminder)
m2 <- lm(pop ~ loggdp * lifeExp, data = gapminder)
stargazer(m1, m2, dep.var.labels = "Population Size",
          title = "Example OLS Regression Output", 
          label = "tab:model1")

## ----persp, fig.cap="Expected Population (millions) by GDP/Capita and Life Expectancy", fig.lab="fig:persp"----
library("margins")
layout(matrix(1:2, nrow = 1))
persp(m1, zlab = "", zlim = c(-180, 180), main = "Additive Only (Model 1)")
persp(m2, zlab = "", zlim = c(-180, 180), main = "Interaction Model (Model 2)")

## ----cplot1, results = "show", fig.cap = "Marginal Effect of GDP per Capita on Population Size, as shown by Expected Value Plot"----
local({
  c1 <- suppressWarnings(cplot(m1, "loggdp", n = 50, 
          xlab = "GDP Per Capita (Logged)",
          se.type = "shade",
          xlim = c(7,10), ylim = c(-30,80)))
  w <- c(which.min((c1[["xvals"]]-8)^2),
         which.min((c1[["xvals"]]-9)^2))
  # dashed
  segments(0, c1[w[2],"yvals"], 9, c1[w[2],"yvals"], lty = 2)
  segments(0, c1[w[1],"yvals"], 8, c1[w[1],"yvals"], lty = 2)
  segments(8, -30, 8, c1[w[1],"yvals"], lty = 2)
  segments(9, -30, 9, c1[w[2],"yvals"], lty = 2)
  
  # red
  segments(8, c1[w[1],"yvals"], 9, c1[w[2],"yvals"], 
           col = "red", lwd = 3)
  segments(8, c1[w[2],"yvals"], 9, c1[w[2],"yvals"], 
           col = "red", lwd = 3)
  segments(8, c1[w[2],"yvals"], 8, c1[w[1],"yvals"], 
           col = "red", lwd = 3)
  text(8, 20, expression(Delta(y) == -26.4), pos = 2, 
       cex = 2, col = "red")
  text(8.5, 0, expression(Delta(x) == 1), cex = 2, col = "red")
  text(9, 40, expression(ME(x) == -26.4), cex = 2, col = "red")
})

## ----deriv, echo = TRUE, results = "show"--------------------------------
deriv(y ~ b1*x1 + b2*x2 + b3*x3 + b4*x1*x2 + 
          b5*x2*x3 + b6*x1*x3 + b7*x1*x2*x3, 
      c("x1", "x2", "x3"))

## ----deriv2, echo = TRUE, results = "show"-------------------------------
deriv(y ~ b1*x1 + b2*x1squared + b3*x2, c("x1", "x2"))

## ----numderiv1, fig.cap = "Approximation of Derivative via One-Sided Numerical Approach"----
curve(x^2, from = -5, to = 4, lwd = 2, las = 1, 
     xlim = c(-1, 4), ylim = c(0,10), 
     xaxt = "n", yaxs = "i", yaxs = "i",
     ylab = "", bty = "l")
axis(1, c(0, 1, 1.25, 1.5, 2, 3))
text(-0.25, 1, expression(f(x) == x^2))
mtext(expression(f(x)), 2, 2, las = 1)

# vertical lines
segments(1,0, 1,1, lty = 2)
segments(1.25,0, 1.25,1.5625, lty = 2)
segments(1.5,0, 1.5,2.25, lty = 2)
segments(2,0, 2,4, lty = 2)
segments(3,0, 3,9, lty = 2)

# tangents
segments(0,-1, 5,9, col = "blue", lwd = 2)
segments(1,1, 1.25, 1.5625, col = "red", lwd = 2)
segments(1,1, 1.5, 2.25, col = "red", lwd = 2)
segments(1,1, 2, 4, col = "red", lwd = 2)
segments(1,1, 3, 9, col = "red", lwd = 2)

# text
text(3.1, 9, expression(paste(frac(paste(Delta, y), paste(Delta, x)) == frac(f(3) - f(1), 2), " = 4")), pos = 4 )
text(3.1, 4, expression(paste(frac(paste(Delta, y), paste(Delta, x)) == frac(f(2) - f(1), 1), " = 3")), pos = 4 )
text(3.1, 2.5, expression(paste(frac(paste(Delta, y), paste(Delta, x)) == frac(f(1.5) - f(1), 0.5), " = 2.5")), pos = 4 )
text(3.1, 1.5, expression(paste(frac(paste(Delta, y), paste(Delta, x)) == frac(f(1.25) - f(1), 0.25), " = 2.25")), pos = 4 )
text(3.1, 0.5, "...", pos = 4)

## ----numderiv2, fig.cap = "Approximation of Derivative via Two-Sided Numerical Approach"----
curve(x^2, from = -5, to = 4, lwd = 2, las = 1, 
     xlim = c(-1, 4), ylim = c(0,10), 
     xaxt = "n", yaxs = "i", yaxs = "i",
     ylab = "", bty = "l")
abline(h = 0, col = "gray")
axis(1, c(0, 0.5, 1, 1.5, 2, 3))
text(-0.25, 1, expression(f(x) == x^2))
mtext(expression(f(x)), 2, 2, las = 1)

# vertical lines
segments(1,0, 1,1, lty = 2)
segments(1.5,0, 1.5,2.25, lty = 2)
segments(2,0, 2,4, lty = 2)
segments(3,0, 3,9, lty = 2)

# tangents
segments(0,-1, 5,9, col = "blue", lwd = 2)
segments(0.5,0.25, 1.5,2.25, col = "red", lwd = 2)
segments(0,0, 2,4, col = "red", lwd = 2)
segments(-1,1, 3,9, col = "red", lwd = 2)

# text
text(3.1, 9, expression(paste(frac(paste(Delta, y), paste(Delta, x)) == frac(f(3) - f(-1), 4), " = 2")), pos = 4 )
text(3.1, 4, expression(paste(frac(paste(Delta, y), paste(Delta, x)) == frac(f(2) - f(0), 2), " = 2")), pos = 4 )
text(3.1, 2.5, expression(paste(frac(paste(Delta, y), paste(Delta, x)) == frac(f(1.5) - f(0.5), 1), " = 2")), pos = 4 )
text(3.1, 0.5, "...", pos = 4)

## ----print, echo=TRUE, results = "show"----------------------------------
str(mar2 <- margins(m2))

## ----summary, echo=TRUE, results = "show"--------------------------------
mar2
summary(mar2)

## ----margins1, echo = TRUE, results = "show"-----------------------------
library("datasets")
m <- lm(mpg ~ wt + am + factor(cyl), data = mtcars)
margins(m)
summary(margins(m))

## ----margins2, echo = TRUE, results = "show"-----------------------------
m <- lm(mpg ~ wt * am + I(wt^2) * am, data = mtcars)
summary(margins(m, at = list(am = 0:1)))

## ----margins3a, echo = TRUE, results = "show"----------------------------
m <- lm(mpg ~ wt * I(wt^2) * hp * I(hp^2), data = mtcars)
margins(m)

## ----margins3b, echo = TRUE, fig.show = "hold"---------------------------
cplot(m, "wt")
cplot(m, "hp")

## ----margins3c, echo = TRUE, fig.show = "hold"---------------------------
persp(m, "wt", "hp")
image(m, "wt", "hp")

## ----margins3d, echo = TRUE, results = "show"----------------------------
m <- lm(mpg ~ wt + am + factor(cyl), data = mtcars)
plot(margins(m))

## ----margins3e, echo = TRUE----------------------------------------------
m <- lm(mpg ~ wt * I(wt^2) * hp * I(hp^2), data = mtcars)
cplot(m, "wt", what = "effect")
persp(m, "wt", "hp", what = "effect", phi = 30)
image(m, "wt", "hp", what = "effect")

## ----log1, results = "asis"----------------------------------------------
m3a <- lm(pop ~ loggdp, data = gapminder)
m3b <- lm(pop ~ I(log(gdpPercap)), data = gapminder)
stargazer(m3a, m3b, dep.var.labels = "Population Size",
          title = "Example of Log Transformation", 
          label = "tab:model3")

## ----log2, echo = TRUE, results = "show"---------------------------------
summary(margins(m3b))

## ----log3, echo = TRUE, results = "show"---------------------------------
summary(margins(m3a))

