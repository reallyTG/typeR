library(qwraps2)


### Name: qroc
### Title: Receiver Operator Curves
### Aliases: qroc qroc_build_data_frame auc

### ** Examples

## Not run: 
##D # load ggplot2 and the diamonds data set
##D library(ggplot2)
##D data(diamonds, package = "ggplot2")
##D 
##D # Create two logistic regression models
##D fit1 <- glm(I(price > 2800) ~ cut * color, data = diamonds, family = binomial())
##D fit2 <- glm(I(price > 2800) ~ cut + color + clarity, data = diamonds, family = binomial())
##D 
##D # Easiest way to get an ROC plot:
##D qroc(fit1)
##D qroc(fit2)
##D 
##D # Create two data sets, this will also let you get the AUC out
##D data1 <- qroc_build_data_frame(fit1)
##D data2 <- qroc_build_data_frame(fit2)
##D 
##D auc(data1)
##D auc(data2)
##D 
##D # Plotting the ROC from the data set can be done too
##D qroc(data1)
##D 
##D # Add the AUC value to the plot title
##D qroc(data2) + ggtitle(paste("Fit 2\nAUC =", round(auc(data2), 2)))
##D 
##D # build a data set for plotting to ROCs on one plot
##D plot_data <- rbind(cbind(Model = "fit1", data1),
##D                    cbind(Model = "fit2", data2))
##D qroc(plot_data) + aes(color = Model) 
##D 
##D # with AUC in the legend
##D plot_data <- rbind(cbind(Model = paste("Fit1\nauc =", round(auc(data1), 3)), data1),
##D                    cbind(Model = paste("Fit2\nauc =", round(auc(data2), 3)), data2))
##D qroc(plot_data) + 
##D   theme_bw() + 
##D   aes(color = Model, linetype = Model) +
##D   theme(legend.position   = "bottom", 
##D         legend.text.align = 0.5)
## End(Not run)




