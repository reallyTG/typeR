library(sirt)


### Name: prior_model_parse
### Title: Parsing a Prior Model
### Aliases: prior_model_parse

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example prior distributions
#############################################################################

#*** define prior model as a string
prior_model <- "
  # prior distributions means
  mu1 ~ dnorm( NA, mean=0, sd=1 )
  mu2 ~ dnorm(NA)       # mean T2 and T3
  # prior distribution standard deviation
  sig1 ~ dunif(NA,0, max=10)
      "

#*** convert priors into a list
res <- sirt::prior_model_parse( prior_model )
str(res)
  ##  List of 3
  ##   $ mu1 :List of 2
  ##    ..$ : chr "dnorm"
  ##    ..$ :List of 3
  ##    .. ..$ NA  : num NA
  ##    .. ..$ mean: num 0
  ##    .. ..$ sd  : num 1
  ##   $ mu2 :List of 2
  ##    ..$ : chr "dnorm"
  ##    ..$ :List of 1
  ##    .. ..$ : num NA
  ##   $ sig1:List of 2
  ##    ..$ : chr "dunif"
  ##    ..$ :List of 3
  ##    .. ..$ NA : num NA
  ##    .. ..$ NA : num 0
  ##    .. ..$ max: num 10



