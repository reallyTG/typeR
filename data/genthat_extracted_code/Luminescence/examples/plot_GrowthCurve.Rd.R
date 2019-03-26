library(Luminescence)


### Name: plot_GrowthCurve
### Title: Fit and plot a growth curve for luminescence data (Lx/Tx against
###   dose)
### Aliases: plot_GrowthCurve

### ** Examples


##(1) plot growth curve for a dummy data.set and show De value
data(ExampleData.LxTxData, envir = environment())
temp <- plot_GrowthCurve(LxTxData)
get_RLum(temp)

##(1a) to access the fitting value try
get_RLum(temp, data.object = "Fit")

##(2) plot the growth curve only - uncomment to use
##pdf(file = "~/Desktop/Growth_Curve_Dummy.pdf", paper = "special")
plot_GrowthCurve(LxTxData)
##dev.off()

##(3) plot growth curve with pdf output - uncomment to use, single output
##pdf(file = "~/Desktop/Growth_Curve_Dummy.pdf", paper = "special")
plot_GrowthCurve(LxTxData, output.plotExtended.single = TRUE)
##dev.off()

##(4) plot resulting function for given intervall x
x <- seq(1,10000, by = 100)
plot(
 x = x,
 y = eval(temp$Formula),
 type = "l"
)

##(5) plot using the 'extrapolation' mode
LxTxData[1,2:3] <- c(0.5, 0.001)
print(plot_GrowthCurve(LxTxData,mode = "extrapolation"))

##(6) plot using the 'alternate' mode
LxTxData[1,2:3] <- c(0.5, 0.001)
print(plot_GrowthCurve(LxTxData,mode = "alternate"))

##(7) import and fit test data set by Berger & Huntley 1989
QNL84_2_unbleached <-
read.table(system.file("extdata/QNL84_2_unbleached.txt", package = "Luminescence"))

results <- plot_GrowthCurve(
 QNL84_2_unbleached,
 mode = "extrapolation",
 plot = FALSE,
 verbose = FALSE)

#calculate confidence interval for the parameters
#as alternative error estimation
confint(results$Fit, level = 0.68)


## Not run: 
##D QNL84_2_bleached <-
##D read.table(system.file("extdata/QNL84_2_bleached.txt", package = "Luminescence"))
##D STRB87_1_unbleached <-
##D read.table(system.file("extdata/STRB87_1_unbleached.txt", package = "Luminescence"))
##D STRB87_1_bleached <-
##D read.table(system.file("extdata/STRB87_1_bleached.txt", package = "Luminescence"))
##D 
##D print(
##D  plot_GrowthCurve(
##D  QNL84_2_bleached,
##D  mode = "alternate",
##D  plot = FALSE,
##D  verbose = FALSE)$Fit)
##D 
##D print(
##D  plot_GrowthCurve(
##D  STRB87_1_unbleached,
##D  mode = "alternate",
##D  plot = FALSE,
##D  verbose = FALSE)$Fit)
##D 
##D print(
##D  plot_GrowthCurve(
##D  STRB87_1_bleached,
##D  mode = "alternate",
##D  plot = FALSE,
##D  verbose = FALSE)$Fit)
##D  
## End(Not run)




