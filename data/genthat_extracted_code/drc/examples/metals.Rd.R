library(drc)


### Name: metals
### Title: Data from heavy metal mixture experiments
### Aliases: metals
### Keywords: datasets

### ** Examples

## One example from the paper by Martin-Betancor et al (2015)

## Figure 2

## Fitting a model for "Zn"
Zn.lgau <- drm(BIF ~ conc, data = subset(metals, metal == "Zn"), 
fct = lgaussian(), bcVal = 0, bcAdd = 10)

## Plotting data and fitted curve
plot(Zn.lgau, log = "", type = "all", 
xlab = expression(paste(plain("Zn")^plain("2+"), " ", mu, "", plain("M"))))

## Calculating effective doses
ED(Zn.lgau, 50, interval = "delta")
ED(Zn.lgau, -50, interval = "delta", bound = FALSE)
ED(Zn.lgau, 99.999,interval = "delta")  # approx. for ED0

## Fitting a model for "Cu"
Cu.lgau <- drm(BIF ~ conc, data = subset(metals, metal == "Cu"), 
fct = lgaussian()) 

## Fitting a model for the mixture Cu-Zn
CuZn.lgau <- drm(BIF ~ conc, data = subset(metals, metal == "CuZn"), 
fct = lgaussian()) 

## Calculating effects needed for the FA-CI plot
CuZn.effects <- CIcompX(0.015, list(CuZn.lgau, Cu.lgau, Zn.lgau), 
c(-5, -10, -20, -30, -40, -50, -60, -70, -80, -90, -99, 99, 90, 80, 70, 60, 50, 40, 30, 20, 10))

## Reproducing the FA-cI plot shown in Figure 5d
plotFACI(CuZn.effects, "ED", ylim = c(0.8, 1.6), showPoints = TRUE)




