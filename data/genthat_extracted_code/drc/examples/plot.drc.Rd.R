library(drc)


### Name: plot.drc
### Title: Plotting fitted dose-response curves
### Aliases: plot.drc
### Keywords: aplot

### ** Examples


## Fitting models to be plotted below
ryegrass.m1 <- drm(rootl~conc, data = ryegrass, fct = LL.4())
ryegrass.m2 <- drm(rootl~conc, data = ryegrass, fct = LL.3())  # lower limit fixed at 0

## Plotting observations and fitted curve for the first model
plot(ryegrass.m1, broken = TRUE) 

## Adding fitted curve for the second model (not much difference)
plot(ryegrass.m2, broken = TRUE, add = TRUE, type = "none", col = 2, lty = 2)

## Add confidence region for the first model.
plot(ryegrass.m1, broken = TRUE, type="confidence", add=TRUE) 

## Finetuning the axis break
plot(ryegrass.m1, broken = TRUE, bcontrol = list(style = "gap"))
plot(ryegrass.m1, broken = TRUE, bcontrol = list(style = "slash"))
plot(ryegrass.m1, broken = TRUE, bcontrol = list(style = "zigzag"))

## Plot without axes
plot(ryegrass.m1, axes = FALSE)

## Fitting model to be plotted below
spinach.m1 <- drm(SLOPE~DOSE, CURVE, data = spinach, fct = LL.4())

## Plot with no colours
plot(spinach.m1, main = "Different line types (default)")

## Plot with default colours
plot(spinach.m1, col = TRUE, main = "Default colours")

## Plot with specified colours
plot(spinach.m1, col = c(2,6,3,23,56), main = "User-specified colours")

## Plot of curves 1 and 2 only
plot(spinach.m1, level = c(1,2), main = "User-specified curves")

## Plot with symbol of different sizes
plot(spinach.m1, cex = c(1,2,3,4,5), main = "User-specified symbil sizes")

## Plot with confidence regions
plot(spinach.m1, col = TRUE, main = "Confidence Regions", type = "confidence")

## Add points
plot(spinach.m1, col = TRUE, add=TRUE)

## Fitting another model to be plotted below
lettuce.m1 <- drm(weight~conc, data = lettuce, fct = LL.4())

## Using the argument 'bp'. Compare the plots!
par(mfrow = c(2, 2))
plot(lettuce.m1, main = "bp = default")  # using the default
plot(lettuce.m1, bp = 1e-4, main = "bp = 1e-4")
plot(lettuce.m1, bp = 1e-6, main = "bp = 1e-6")
plot(lettuce.m1, bp = 1e-8, main = "bp = 1e-8")
par(mfrow = c(1,1))

## User-specified position of legend
S.alba.m1 <- drm(DryMatter~Dose, Herbicide, data = S.alba, fct = LL.4())

plot(S.alba.m1)
plot(S.alba.m1, legendPos = c(0.3, 4.8))




