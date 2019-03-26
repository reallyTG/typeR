library(interplot)


### Name: interplot
### Title: Plot Conditional Coefficients of a Variable in an Interaction
###   Term
### Aliases: interplot

### ** Examples

data(mtcars)
m_cyl <- lm(mpg ~ wt * cyl, data = mtcars)
library(interplot)

# Plot interactions with a continous conditioning variable
interplot(m = m_cyl, var1 = 'cyl', var2 = 'wt') +
xlab('Automobile Weight (thousands lbs)') +
ylab('Estimated Coefficient for Number of Cylinders') +
ggtitle('Estimated Coefficient of Engine Cylinders\non Mileage by Automobile Weight') +
theme(plot.title = element_text(face='bold'))


# Plot interactions with a categorical conditioning variable
interplot(m = m_cyl, var1 = 'wt', var2 = 'cyl') +
xlab('Number of Cylinders') +
ylab('Estimated Coefficient for Automobile Weight (thousands lbs)') +
ggtitle('Estimated Coefficient of Automobile Weight \non Mileage by Engine Cylinders') +
theme(plot.title = element_text(face='bold'))




