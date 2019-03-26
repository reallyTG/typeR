## ----eval=FALSE----------------------------------------------------------
#  install.packages("CityWaterBalance")

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github("USEPA/CityWaterBalance",
#                           build_vignettes = TRUE)

## ------------------------------------------------------------------------
library("CityWaterBalance")

## ------------------------------------------------------------------------
# Specify parameters
p <- list("interc" = 0, "et_mult" = 1, "flow_mult" = 1, "open_wat" = 0.02, "run_mult" = 1, "run_css" = 0.35, "bf_mult" = 1, "nonrev" = 0.08,"ind_evap" = 0.012, "wast_gen" = 0.85, "pot_atm" = 0.13, "npot_infilt" = 0.5, "slud_evap" = 0, "leak_css" = 0.05, "dgw" = 0.5,"dgw_rep" = 0.5)

# Run model
m <- CityWaterBalance(cwb_data,p, print=FALSE)

## ------------------------------------------------------------------------
# Visualize output
gf <- m$global_flows
plotWaterBalance(gf, yl = "Flux (mm/month)")

## ---- eval=FALSE---------------------------------------------------------
#  geometry <- 'sample:Counties'
#  attribute <- 'STATE'
#  value <- 'RI'
#  area <- 2707
#  start <- "2010-01-01"
#  end <- "2010-12-31"

## ---- eval=FALSE---------------------------------------------------------
#  latitude <- 41.5801
#  atm <- getAtmoFlows(start, end, geometry, attribute, value, latitude)

## ---- eval=FALSE---------------------------------------------------------
#  
#  ingages <- c("01112500")
#  outgages <-c("01113895","01114000","01117000","01118500")
#  
#  inflows <- getStreamflow(start,end,ingages)
#  outflows<- getStreamflow(start,end,outgages)
#  

## ---- eval=FALSE---------------------------------------------------------
#  states <- c("RI")
#  counties <- list(c("Providence","Kent","Bristol","Newport","Washington"))
#  wu_raw <- getWaterUse(states,counties,years="ALL")

## ---- eval=FALSE---------------------------------------------------------
#  wu <- combineWaterUse(start,end,wu_raw)

## ---- eval=FALSE---------------------------------------------------------
#  
#  # combine streamflow among gauges
#  inflow <- combineStreamflow(inflows, c(1))
#  outflow <- combineStreamflow(outflows, c(1,1,1,1))
#  model_data <- mergeData(area,atm,inflow,outflow,wu)

## ---- eval=FALSE---------------------------------------------------------
#  
#  d <- cwb_data
#  d$cso <- 0
#  
#  params <- list("interc" = 0, "et_mult" = 1, "flow_mult" = 1, "open_wat" = 0.02, "run_mult" = 1, "run_css" = 0.35, "bf_mult" = 1, "nonrev" = 0.08,"ind_evap" = 0.012, "wast_gen" = 0.85, "pot_atm" = 0.13, "npot_infilt" = 0.5, "slud_evap" = 0, "leak_css" = 0.05, "dgw" = 0.5,"dgw_rep" = 0.5)
#  
#  low <- median(cwb_data$cso,na.rm=TRUE)*nrow(cwb_data)
#  high <- mean(cwb_data$cso,na.rm=TRUE)*nrow(cwb_data)
#  css_crit <- c(low,high)
#  
#  out <- getSolutions(data = d, p = params, n = 100, tol = 100, css_bal = css_crit)
#  boxplot(out[,order(colMeans(out),decreasing=TRUE)]/sum(d$prcp),las = 2,
#  ylab = "flow/precipitation", ylim = c(0,1),col = c("lightblue1"),
#  border = c("royalblue3"))
#  

