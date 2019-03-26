## ------------------------------------------------------------------------
## Load library
library(dalmatian)

## Load simulated data
data(weights_1_simulate)
head(weights.df)

## ------------------------------------------------------------------------
## Mean model
mymean=list(fixed=list(name="alpha",formula=~ x,
            priors=list(c("dnorm",0,.001))))

## Variance model
myvar=list(fixed=list(name="psi",link="log",formula=~ x,
           priors=list(c("dnorm",0,.001))))

## Set working directory
## By default uses a system temp directory. You probably want to change this.
workingDir <- tempdir()

## Define list of arguments for jags.model()
jm.args = list(file="weights_1_jags.R",n.adapt=1000)

## Define list of arguments for coda.samples()
cs.args = list(n.iter=1000)

## Run the model using dalmatian
results1 <- dalmatian(
  df = weights.df,
  mean.model = mymean,
  variance.model = myvar,
  jags.model.args = jm.args,
  coda.samples.args = cs.args,
  response = "y",
  overwrite = TRUE,
  debug = FALSE
)

## Numerical summary statistics
summary(results1)

## Graphical summaries
caterpillar1 <- caterpillar(results1)

## ------------------------------------------------------------------------
## Specify column containing weights
myvar$weights = "n"

## Run model
jm.args = list(file="weights_2_jags.R",n.adapt=1000)

results2 = dalmatian(df=weights.df,
                        mean.model=mymean,
                        variance.model=myvar,
                        jags.model.args=jm.args,
                        coda.samples.args=cs.args,
                        response="y",
                     overwrite = TRUE,
                        debug=FALSE)

## Numerical summary statistics
summary(results2)

## Graphical summaries
caterpillar2 <- caterpillar(results2)


