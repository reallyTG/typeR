library(psycho)


### Name: get_data
### Title: Extract the dataframe used in a model.
### Aliases: get_data

### ** Examples

## Not run: 
##D library(tidyverse)
##D library(psycho)
##D 
##D df <- mtcars %>%
##D   mutate(
##D     cyl = as.factor(cyl),
##D     gear = as.factor(gear)
##D   )
##D 
##D fit <- lm(wt ~ mpg, data = df)
##D fit <- lm(wt ~ cyl, data = df)
##D fit <- lm(wt ~ mpg * cyl, data = df)
##D fit <- lm(wt ~ cyl * gear, data = df)
##D fit <- lmerTest::lmer(wt ~ mpg * gear + (1 | cyl), data = df)
##D fit <- rstanarm::stan_lmer(wt ~ mpg * gear + (1 | cyl), data = df)
##D 
##D get_data(fit)
## End(Not run)




