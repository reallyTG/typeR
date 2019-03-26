library(TSDT)


### Name: ctree_wrapper
### Title: ctree_wrapper
### Aliases: ctree_wrapper

### ** Examples

requireNamespace( "party", quietly = TRUE )
## From party::ctree() examples:
set.seed(290875)
airq <- subset(airquality, !is.na(Ozone))

## Provide response and covariates to fit ctree
ex1 <- ctree_wrapper( response = airq$Ozone,
                      covariates = subset( airq, select = -Ozone ) )

## Pass list of control parameters. Note that ctree takes a parameter called
## 'controls' (with an 's'), rather than 'control' as in rpart.
ex2 <- ctree_wrapper( response = airq$Ozone,
                      covariates = subset( airq, select = -Ozone ),
                      tree_builder_parameters = list( controls =
                                             party::ctree_control( maxdepth = 2 ) ) )



