library(pubh)


### Name: bar_error
### Title: Bar charts with error bars.
### Aliases: bar_error

### ** Examples

data(birthwt, package = "MASS")
birthwt$smoke <- factor(birthwt$smoke, labels = c("Non-smoker", "Smoker"))
gen_bst_df(bwt ~ smoke, data = birthwt) # To estimate limits of y-axis.
bar_error(bwt ~ smoke, data = birthwt, ylab = "Birth weight (g)", ylim = c(0, 3500))

birthwt$race <- factor(birthwt$race, labels = c("White", "African American", "Other"))
gen_bst_df(bwt ~ race|smoke, data = birthwt) # To estimate limits of y-axis.
bar_error(bwt ~ race|smoke, data = birthwt, ylab = "Birth weight (g)", ylim = c(0, 3800))

bar_error(bwt ~ race|smoke, data = birthwt, ylab = "Birth weight (g)", ylim = c(0, 3800),
          col = c("gray95", "gray20", "gray50"))



