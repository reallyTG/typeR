library(plotMElm)


### Name: plot_me
### Title: Plot marginal effects from two-way interactions in linear
###   regressions
### Aliases: plot_me

### ** Examples

## Continuous Term1 and Term2
# Estimate model
states <- as.data.frame(state.x77)
m1 <- lm(Murder ~ Income * Population, data = states)

# Plot marginal effect of Income across the observed range of Population
# on the Murder rate
plot_me(m1, 'Income', 'Population', ci = 95)

# CI created using false discovery rate limiting t-statistic
plot_me(m1, 'Income', 'Population', ci_type = 'fdr')

# Return marginal effects as a data frame
plot_me(m1, 'Income', 'Population', plot = FALSE)

## Term 2 with <= 5 unique values
# Estimate model
m2 <- lm(mpg ~ wt * cyl, data = mtcars)

# Plot marginal effect of Weight across the Number of Cylinders (continuous)
plot_me(m2, 'wt', 'cyl')

## Categorical (factor) Term2
# Set Term 2 as a factor variable
mtcars$cyl <- factor(mtcars$cyl,
                 labels = c('4 Cyl', '6 Cyl', '8 Cyl'))

# Estimate model
m3 <- lm(mpg ~ wt * cyl, data = mtcars)

# Plot marginal effect of Weight across the Number of Cylinders (factor)
plot_me(m3, 'wt', 'cyl')




