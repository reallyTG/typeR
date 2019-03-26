library(forestmangr)


### Name: guide_curve
### Title: Get the guide curve plot for growth and yield analysis of
###   inventory data
### Aliases: guide_curve

### ** Examples

data("exfm14")
exfm14

# To get a guide curve plot for this data, we simply need to input
# dominant height and age variables, age index, and number of classes to be used:
guide_curve(exfm14, "dh", "age", 72, 5)

# if we want to get the table used to get the plot, we can choose the output "table":
guide_curve(exfm14, "dh", "age", 72, 5, output = "table")

# Other models are available for use, such as Curtis, Chapman Richards, and Bailey:
# CR and BC models are non linear, and thus need start values. There are default values,
# but they may fail, depending on the data used, so it's recommended to try start values that
# are ideal for the data used:
guide_curve(exfm14, "dh", "age", 72, 5,
 model = "Chapman-Richards", start_chap = c(b0=23, b1=0.03, b2 = 1.3))

# Or, to get more information on the analysis, such as details on the regression,
# bias, rmse, plot for residuals and more (cpu taxing):
## Not run: 
##D guide_curve(exfm14, "dh", "age", 72, 5, output = "full")
## End(Not run)



