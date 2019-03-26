library(Hmisc)


### Name: stat_plsmo
### Title: Add a lowess smoother without counfidence bands.
### Aliases: stat_plsmo

### ** Examples

## No test: 
c <- ggplot(mtcars, aes(qsec, wt))
c + stat_plsmo()
c + stat_plsmo() + geom_point()

c + stat_plsmo(span = 0.1) + geom_point()

# Smoothers for subsets
c <- ggplot(mtcars, aes(y=wt, x=mpg)) + facet_grid(. ~ cyl)
c + stat_plsmo() + geom_point()
c + stat_plsmo(fullrange = TRUE) + geom_point()

# Geoms and stats are automatically split by aesthetics that are factors
c <- ggplot(mtcars, aes(y=wt, x=mpg, colour=factor(cyl)))
c + stat_plsmo() + geom_point()
c + stat_plsmo(aes(fill = factor(cyl))) + geom_point()
c + stat_plsmo(fullrange=TRUE) + geom_point()


# Example with logistic regression
data("kyphosis", package="rpart")
qplot(Age, as.numeric(Kyphosis) - 1, data = kyphosis) + stat_plsmo()
## End(No test)



