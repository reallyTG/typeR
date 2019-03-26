library(beeswarm)


### Name: beeswarm
### Title: Bee swarm plot
### Aliases: beeswarm beeswarm.default beeswarm.formula
### Keywords: hplot

### ** Examples
 
  
  ## One of the examples from 'stripchart'
  beeswarm(decrease ~ treatment,
    data = OrchardSprays, log = TRUE, 
    pch = 16, col = rainbow(8))

  ## One of the examples from 'boxplot', with a beeswarm overlay
   boxplot(len ~ dose, data = ToothGrowth,
              main = "Guinea Pigs' Tooth Growth",
              xlab = "Vitamin C dose mg",
              ylab = "Tooth length")  
   beeswarm(len ~ dose, data = ToothGrowth, col = 2, add = TRUE)

  ## Compare the 4 methods
  op <- par(mfrow = c(2,2))
  for (m in c("swarm", "center", "hex", "square")) {
    beeswarm(len ~ dose, data = ToothGrowth, method = m, main = m)
  }
  par(op)

  ## Demonstrate the use of 'pwcol'
  data(breast)
  beeswarm(time_survival ~ ER, data = breast,
    pch = 16, pwcol = 1 + as.numeric(event_survival),
    xlab = "", ylab = "Follow-up time (months)",
    labels = c("ER neg", "ER pos"))
  legend("topright", legend = c("Yes", "No"),
    title = "Censored", pch = 16, col = 1:2)

  ## The list interface
  distributions <- list(runif = runif(200, min = -3, max = 3), 
                        rnorm = rnorm(200),
                        rlnorm = rlnorm(200, sdlog = 0.5))
  beeswarm(distributions, col = 2:4)

  ## Demonstrate 'pwcol' with the list interface 
  myCol <- lapply(distributions, function(x) cut(x, breaks = quantile(x), labels = FALSE))
  beeswarm(distributions, pch = 16, pwcol = myCol)
  legend("bottomright", legend = 1:4, pch = 16, col = 1:4, title = "Quartile")

  ## Demonstrate the 'corral' methods
  par(mfrow = c(2,3))
  beeswarm(distributions, col = 2:4, 
    main = 'corral = "none" (default)')
  beeswarm(distributions, col = 2:4, corral = "gutter", 
    main = 'corral = "gutter"')
  beeswarm(distributions, col = 2:4, corral = "wrap", 
    main = 'corral = "wrap"')
  beeswarm(distributions, col = 2:4, corral = "random", 
    main = 'corral = "random"')
  beeswarm(distributions, col = 2:4, corral = "omit", 
    main = 'corral = "omit"')  
 
  ## Demonstrate 'side' and 'priority'
  par(mfrow = c(2,3))
  beeswarm(distributions, col = 2:4, 
    main = 'Default')
  beeswarm(distributions, col = 2:4, side = -1, 
    main = 'side = -1')
  beeswarm(distributions, col = 2:4, side = 1, 
    main = 'side = 1')
  beeswarm(distributions, col = 2:4, priority = "descending", 
    main = 'priority = "descending"')
  beeswarm(distributions, col = 2:4, priority = "random", 
    main = 'priority = "random"')  
  beeswarm(distributions, col = 2:4, priority = "density", 
    main = 'priority = "density"')  



