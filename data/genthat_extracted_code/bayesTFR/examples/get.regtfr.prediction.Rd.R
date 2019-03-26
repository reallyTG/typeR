library(bayesTFR)


### Name: get.regtfr.prediction
### Title: Accessing Subnational Prediction Objects
### Aliases: get.regtfr.prediction
### Keywords: manip

### ** Examples

# Subnational example data
my.subtfr.file <- file.path(find.package("bayesTFR"), 'extdata', 'subnational_tfr_template.txt')
subtfr <- read.delim(my.subtfr.file, check.names=FALSE, stringsAsFactor=FALSE)
countries <- unique(subtfr[, c("country_code", "country")])

# Directory with national projections (contains 30 trajectories for each country)
nat.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")

# Subnational projections for all three countries ()
subnat.dir <- tempfile()
tfr.predict.subnat(countries$country_code, my.tfr.file=my.subtfr.file,
    sim.dir=nat.dir, output.dir=subnat.dir, start.year=2013)
    
# Retrieve results for all countries
preds <- get.regtfr.prediction(subnat.dir)
names(preds)

# View tables of subregions for each country
for(i in 1:nrow(countries)) {
  cat("\n\n", countries$country[i], "\n")
  print(get.countries.table(preds[[as.character(countries$country_code[i])]]))
}
# Quantiles for individual subregions
tfr.trajectories.table(preds[["218"]], "Bolivar")

# Retrieve results for one country
pred <- get.regtfr.prediction(subnat.dir, 218)
tfr.trajectories.plot(pred, "Loja")

# cleanup
unlink(subnat.dir)

# See more examples in ?tfr.predict.subnat



