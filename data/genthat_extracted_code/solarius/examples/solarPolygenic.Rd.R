library(solarius)


### Name: solarPolygenic
### Title: Run polygenic analysis.
### Aliases: solarPolygenic

### ** Examples

### load data and check out ID names
data(dat30)
matchIdNames(names(dat30))

## Not run: 
##D ### basic (univariate) polygenic model
##D mod <- solarPolygenic(trait1 ~ age + sex, dat30)
##D 
##D ### (univariate) polygenic model with parameters
##D mod <- solarPolygenic(trait1 ~ age + sex, dat30, covtest = TRUE)
##D mod$cf # look at test statistics for covariates
##D 
##D ### basic (bivariate) polygenic model
##D mod <- solarPolygenic(trait1 + trait2 ~ 1, dat30)
##D mod$vcf # look at variance components
##D 
##D ### (bivariate) polygenic model with trait specific covariates
##D mod <- solarPolygenic(trait1 + trait2 ~ age + sex(trait1), dat30)
##D 
##D ### (bivariate) polygenic model with a test of the genetic correlation
##D mod <- solarPolygenic(trait1 + trait2 ~ 1, dat30, polygenic.options = "-testrhog")
##D mod$lf # look at a p-value of the test
##D 
##D ### transforms for (univariate) polygenic model
##D mod <- mod <- solarPolygenic(trait1 ~ 1, dat30, transforms = "log")
##D 
##D ### transforms for (bivariate) polygenic model
##D mod <- solarPolygenic(trait1 + trait2 ~ 1, dat30,
##D    transforms = c(trait1 = "log", trait2 = "inormal"))
##D 
##D ### SOLAR format of introducing covariates
##D mod <- solarPolygenic(traits = "trait1", covlist = "age^1,2,3#sex", data =  dat30)
##D mod$cf # 8 covariate terms will be printed
##D 
## End(Not run)



