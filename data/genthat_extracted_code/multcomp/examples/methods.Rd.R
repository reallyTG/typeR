library(multcomp)


### Name: glht-methods
### Title: Methods for General Linear Hypotheses
### Aliases: summary.glht confint.glht coef.glht vcov.glht plot.glht
###   plot.confint.glht univariate adjusted Ftest Chisqtest adjusted_calpha
###   univariate_calpha
### Keywords: htest

### ** Examples


  ### set up a two-way ANOVA 
  amod <- aov(breaks ~ wool + tension, data = warpbreaks)

  ### set up all-pair comparisons for factor `tension'
  wht <- glht(amod, linfct = mcp(tension = "Tukey"))

  ### 95% simultaneous confidence intervals
  plot(print(confint(wht)))

  ### the same (for balanced designs only)
  TukeyHSD(amod, "tension")

  ### corresponding adjusted p values
  summary(wht)

  ### all means for levels of `tension'
  amod <- aov(breaks ~ tension, data = warpbreaks)
  glht(amod, linfct = matrix(c(1, 0, 0, 
                               1, 1, 0, 
                               1, 0, 1), byrow = TRUE, ncol = 3))

  ### confidence bands for a simple linear model, `cars' data
  plot(cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)",
       las = 1)

  ### fit linear model and add regression line to plot
  lmod <- lm(dist ~ speed, data = cars)
  abline(lmod)

  ### a grid of speeds
  speeds <- seq(from = min(cars$speed), to = max(cars$speed), 
                length = 10)

  ### linear hypotheses: 10 selected points on the regression line != 0
  K <- cbind(1, speeds)                                                        

  ### set up linear hypotheses
  cht <- glht(lmod, linfct = K)

  ### confidence intervals, i.e., confidence bands, and add them plot
  cci <- confint(cht)
  lines(speeds, cci$confint[,"lwr"], col = "blue")
  lines(speeds, cci$confint[,"upr"], col = "blue")


  ### simultaneous p values for parameters in a Cox model
  if (require("survival") && require("MASS")) {
      data("leuk", package = "MASS")
      leuk.cox <- coxph(Surv(time) ~ ag + log(wbc), data = leuk)

      ### set up linear hypotheses
      lht <- glht(leuk.cox, linfct = diag(length(coef(leuk.cox))))

      ### adjusted p values
      print(summary(lht))
  }




