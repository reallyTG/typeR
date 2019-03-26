## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  error = FALSE,
  tidy = FALSE,
  out.extra='style="display:block; margin: auto"', 
  fig.align="center", 
  fig.width=6, 
  fig.height=6, 
  dev='png'
)

## ------------------------------------------------------------------------
library(efts)
timeAxisStart <- ISOdate(year=2010, month=08, day=01, hour = 12, min = 0, sec = 0, tz = "UTC")
timeDimInfo <- create_time_info(from=timeAxisStart, n=48, time_step='hours since', time_step_delta=1L)
str(timeDimInfo)

## ------------------------------------------------------------------------
variable_names <- c('rain_sim','pet_sim')
varDef <- create_variable_definition_dataframe(variable_names=variable_names, long_names = rep('synthetic data', 2), dimensions=4L)
str(varDef)

## ------------------------------------------------------------------------
stationIds <- c(123,456)
nEns <- 3
nLead <- 4
fname <- tempfile() # or something you prefer.

## ------------------------------------------------------------------------
global_attr <- create_global_attributes(
  title="data set title", 
  institution="my org", 
  catchment="My_Catchment", 
  source="A journal reference, URL", 
  comment="example for vignette")

## ------------------------------------------------------------------------
(opt_metadatavars <- default_optional_variable_definitions_v2_0())

## ------------------------------------------------------------------------
snc <- create_efts(
  fname=fname,
  data_var_definitions=varDef,
  optional_vars=opt_metadatavars,
  time_dim_info=timeDimInfo,
  stations_ids=stationIds,
  station_names=NULL,
  nc_attributes=global_attr,
  lead_length=nLead,
  ensemble_length=nEns)

## ------------------------------------------------------------------------
snc

## ------------------------------------------------------------------------
str(snc, max.level=2)

## ------------------------------------------------------------------------
set.seed(42)
td <- snc$get_time_dim()
for (i in 1:length(td)) {
	for (station in stationIds) {
		rain <- 6 * rnorm(nEns*nLead)
		rain <- matrix(pmax(as.numeric(rain), 0), nrow=nLead) # nEns replicates of a forecast of length nLead
		pet <- 6.0 + rnorm(nEns*nLead)
		pet <- matrix(pmax(as.numeric(pet), 0), nrow=nLead)
		dtime = td[i]
		snc$put_ensemble_forecasts(rain, variable_name = variable_names[1], identifier = station, start_time = dtime) 
		snc$put_ensemble_forecasts(pet,  variable_name = variable_names[2], identifier = station, start_time = dtime) 
	}
}

## ---- eval=FALSE---------------------------------------------------------
#  if (!exists('snc')) snc <- open_efts(fname)

## ------------------------------------------------------------------------
td <- snc$get_time_dim()
timeStamp <- td[5] # for instance
d <- snc$get_ensemble_forecasts(variable_names[2], stationIds[1], start_time=timeStamp)
str(d)

## ------------------------------------------------------------------------
zoo::plot.zoo(d)

## ------------------------------------------------------------------------
paste0( "UTC offset as a string: ", snc$get_utc_offset())
paste0( "UTC offset as a difftime: ", snc$get_utc_offset(as_string=FALSE))

## ------------------------------------------------------------------------
snc$close()
rm(snc)

## ------------------------------------------------------------------------
if(file.exists(fname)) file.remove(fname)

