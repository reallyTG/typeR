## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo=TRUE-----------------------------------------------------------
library(FENmlm)
data(trade)


## ---- echo=FALSE, results='asis'-----------------------------------------
tab = head(trade)
knitr::kable(tab)

## ------------------------------------------------------------------------
gravity_results <- femlm(Euros ~ log(dist_km), trade, family = "poisson", cluster = c("Origin", "Destination", "Product", "Year"))

## ------------------------------------------------------------------------
gravity_results <- femlm(Euros ~ log(dist_km)|Origin+Destination+Product+Year, trade)

## ------------------------------------------------------------------------
print(gravity_results)

## ------------------------------------------------------------------------
summary(gravity_results, se = "twoway")

## ------------------------------------------------------------------------
# Equivalent ways of clustering the SEs:
# - using the vector:
summary(gravity_results, se = "cluster", cluster = trade$Product)
# - by reference (only possible because Product has been used as a cluster in the estimation):
summary(gravity_results, se = "cluster", cluster = "Product")

## ------------------------------------------------------------------------
gravity_simple = femlm(Euros ~ log(dist_km), trade)
summary(gravity_simple, se = "twoway", cluster = trade[, c("Origin", "Destination")])


## ------------------------------------------------------------------------
gravity_results_negbin <- femlm(Euros ~ log(dist_km)|Origin+Destination+Product+Year, trade, family = "negbin")


## ------------------------------------------------------------------------
gravity_results_gaussian <- femlm(log(Euros) ~ log(dist_km)|Origin+Destination+Product+Year, trade, family = "gaussian")

## ---- eval=FALSE---------------------------------------------------------
#  res2table(gravity_results, gravity_results_negbin, gravity_results_gaussian, se = "twoway", subtitles = c("Poisson", "Negative Binomial", "Gaussian"))

## ---- echo=FALSE, results='asis'-----------------------------------------
tab = res2table(gravity_results, gravity_results_negbin, gravity_results_gaussian, se = "twoway", subtitles = c("Poisson", "Negative Binomial", "Gaussian"))
# problem to display the second empty line in markdown
knitr::kable(tab[-2, ])

## ------------------------------------------------------------------------
gravity_subcluster = list()
all_clusters = c("Year", "Destination", "Origin", "Product")
for(i in 1:4){
	gravity_subcluster[[i]] = femlm(Euros ~ log(dist_km), trade, cluster = all_clusters[1:i])
}

## ---- eval=FALSE---------------------------------------------------------
#  res2table(gravity_subcluster, se = "twoway", cluster = trade[, c("Origin", "Destination")])

## ---- echo=FALSE, results='asis'-----------------------------------------
tab = res2table(gravity_subcluster, se = "twoway", cluster = trade[, c("Origin", "Destination")])
knitr::kable(tab)

## ------------------------------------------------------------------------
res2tex(gravity_subcluster, se = "twoway", cluster = trade[, c("Origin", "Destination")])

## ---- eval=FALSE---------------------------------------------------------
#  # we set the dictionary once and for all
#  myDict = c("log(dist_km)" = "$\\ln (Distance)$", "(Intercept)" = "Constant")
#  # 1st export: we change the signif code and drop the intercept
#  res2tex(gravity_subcluster, signifCode = c("a" = 0.01, "b" = 0.05), drop = "Int", dict = myDict, file = "Estimation Table.tex", append = FALSE, title = "First export -- normal Standard-errors")
#  # 2nd export: clustered S-E + distance as the first coefficient
#  res2tex(gravity_subcluster, se = "cluster", cluster = trade$Product, order = "dist", dict = myDict, file = "Estimation Table.tex", title = "Second export -- clustered standard-errors (on Product variable)")
#  

## ------------------------------------------------------------------------
fixedEffects <- getFE(gravity_results)
fixedEffects

## ------------------------------------------------------------------------
fixedEffects$Year

## ---- fig.width=7--------------------------------------------------------
plot(fixedEffects)

## ------------------------------------------------------------------------
# Generating data:
n = 1000
# x and y: two positive random variables
x = rnorm(n, 1, 5)**2
y = rnorm(n, -1, 5)**2
# E(z) = 2*x + 3*y and some noise
z = rpois(n, 2*x + 3*y) + rpois(n, 1)
base = data.frame(x, y, z)

## ------------------------------------------------------------------------
result_NL = femlm(z~0, base, NL.fml = ~ log(a*x + b*y), NL.start = list(a=1, b=1), lower = list(a=0, b=0))

## ------------------------------------------------------------------------
print(result_NL)

## ------------------------------------------------------------------------
# the class of each observation
id = sample(20, n, replace = TRUE)
base$id = id
# the vector of fixed-effects
gamma = rnorm(20)**2
# the new vector z_bis
z_bis = rpois(n, gamma[id] * (2*x + 3*y)) + rpois(n, 1)
base$z_bis = z_bis

## ------------------------------------------------------------------------
# we add the fixed-effect in the formula
result_NL_fe = femlm(z_bis~0|id, base, NL.fml = ~ log(2*x + b*y), NL.start = list(b=1), lower = list(b=0))
# The coef should be around 3
result_NL_fe$coef
# the gamma and the exponential of the fixed-effects should be similar
rbind(gamma, exp(getFE(result_NL_fe)$id))


## ---- eval = FALSE-------------------------------------------------------
#  # Sample of results:
#  # 1 core: 2.7s
#  system.time(femlm(Euros ~ log(dist_km)|Origin+Destination+Product+Year, trade, family = "negbin", cores = 1))
#  # 2 cores: 1.74s
#  system.time(femlm(Euros ~ log(dist_km)|Origin+Destination+Product+Year, trade, family = "negbin", cores = 2))
#  # 4 cores: 1.31s
#  system.time(femlm(Euros ~ log(dist_km)|Origin+Destination+Product+Year, trade, family = "negbin", cores = 4))

## ------------------------------------------------------------------------
base_coll = trade
base_coll$constant_variable = 1
res <- femlm(Euros ~ log(dist_km) + constant_variable|Origin+Destination+Product+Year, base_coll)
diagnostic(res)


