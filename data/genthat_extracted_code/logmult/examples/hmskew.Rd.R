library(logmult)


### Name: hmskew
### Title: Fitting van der Heijden & Mooijaart Skew-Symmetric Association
###   Model
### Aliases: hmskew print.hmskew

### ** Examples

  ## van der Heijden & Mooijaart (1995), Table 2c, p. 23
  data(ocg1973)

  # 5:1 is here to take "Farmers" as reference category (angle 0)
  model <- hmskew(ocg1973[5:1, 5:1], weighting="uniform")
  model
  ass <- model$assoc.hmskew

  # First column of the table
  round(ass$row[,,1] * sqrt(ass$phi[1,1]), d=2)[5:1,]

  # Right part of the table
  round(ass$phi[1] * (ass$row[,2,1] %o% ass$row[,1,1] -
                      ass$row[,1,1] %o% ass$row[,2,1]), d=3)[5:1, 5:1]

  # Plot
  plot(model, coords="cartesian")



