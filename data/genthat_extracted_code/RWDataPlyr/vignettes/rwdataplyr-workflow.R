## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- rwFlowChart, fig.cap="RiverWare and RiverSMART output flow chart. Part A shows a single RiverWare run; part B shows how RiverSMART wraps individual RiverSMART runs to produce output, with those output becoming input to RiverSMART for post-processing. The color of the file extensions correspond to the color of the functions that read those file types; yellow indicates that reading NetCDF files is not yet supported by RWDataPlyr.", echo=FALSE----
knitr::include_graphics("RiverWareFlowChart.png")

## ----oneScen-------------------------------------------------------------
library(RWDataPlyr)
suppressPackageStartupMessages(library(dplyr))
rdf <- read_rdf(system.file(
  "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most/KeySlots.rdf", 
  package = "RWDataPlyr"
))

# ensure the slot you want is in the rdf:
rdf_slot_names(rdf)

# then get the minimum annual Mead pool elevation for all 5 years and 4 traces
rdf %>% 
  rdf_get_slot("Mead.Pool Elevation") %>%
  rwslot_annual_min()

## ----csvExmpl------------------------------------------------------------
library(tidyr)
read_rw_csv(system.file(
  "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most/KeySlots.csv",
  package = "RWDataPlyr"
)) %>%
  filter(ObjectSlot == "Mead.Pool Elevation") %>% 
  group_by(Year, TraceNumber) %>% 
  summarise(Value = min(Value)) %>%
  spread(TraceNumber, Value) %>%
  as.data.frame()

## ----customSummer--------------------------------------------------------
summer <- function() 
{
  list(
    fun = function(x) x, 
    filter_months = c("June", "July", "August"), 
    group_tbl = c("Year")
  )
}

## ----customWinter--------------------------------------------------------
djf <- function()
{
  djf_convert <- function(rwtbl)
  {
    rwtbl %>%
      dplyr::mutate_at(
        "Timestep", 
        .funs = dplyr::funs("ym" = zoo::as.yearmon)
      ) %>%
      # can use the ym_get_wateryear b/c djf are all in same water year
      dplyr::mutate_at("ym", .funs = dplyr::funs("Year" = ym_get_wateryear)) %>%
      dplyr::select(-dplyr::one_of("ym"))
  }
  
  list(
    fun = djf_convert, 
    filter_months = month.name[c(12, 1, 2)], 
    group_tbl = c("Year")
  )
  
}

## ----echo=FALSE, results="asis"------------------------------------------
knitr::kable(data.frame(
  file = c(rep("KeySlots.rdf", 5), "SystemConditions.rdf"),
  slot = c(
    rep("Mead.Pool Elevation", 2), 
    rep("Powell.Outflow", 3), 
    "SummaryOutputData.LBShortageConditions"
  ), 
  period = c("cy", "eocy", "djf", "July", "wy", "asis"),
  summary = c("min", NA, "sum", NA, "sum", NA),
  eval = c("<=", rep(NA, 5)),
  t_s = formatC(
    c(1060, NA, 0.001, NA, 0.000001, NA), 
    big.mark = ",", 
    drop0trailing = TRUE
  ),
  variable = c("meadLt1060", "meadEocy", "powellDjfRel", "powellJulRel", 
               "powellWyRel", "short")
))

## ----rwdAgg--------------------------------------------------------------
rwa1 <- rwd_agg(data.frame(
  file = c(rep("KeySlots.rdf", 5), "SystemConditions.rdf"),
  slot = c(
    rep("Mead.Pool Elevation", 2), 
    rep("Powell.Outflow", 3), 
    "SummaryOutputData.LBShortageConditions"
  ), 
  period = c("cy", "eocy", "djf", "July", "wy", "asis"),
  summary = c("min", NA, "sum", NA, "sum", NA),
  eval = c("<=", rep(NA, 5)),
  t_s = c(1060, NA, 0.001, NA, 0.000001, NA),
  variable = c("meadLt1060", "meadEocy", "powellDjfRel", "powellJulRel", 
               "powellWyRel", "short"),
  stringsAsFactors = FALSE
))

## ----rdfAgg--------------------------------------------------------------
rdf_aggregate(
  rwa1,
  rdf_dir = system.file(
    "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most/",
    package = "RWDataPlyr"
  )
)

## ----rdfAgg2-------------------------------------------------------------
rdf_aggregate(
  rwa1,
  rdf_dir = system.file(
    "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most/",
    package = "RWDataPlyr"
  ),
  keep_cols = TRUE
)

## ----dirStruct, results="asis",fig.cap="Sample directory structure", echo=FALSE----
knitr::include_graphics("dir_structure.png")

## ----scenAgg`------------------------------------------------------------
my_scens <-c("ISM1988_2014,2007Dems,IG,Most", "ISM1988_2014,2007Dems,IG,2002")
names(my_scens) <- c("most", "yr2002")
scen_res <- rw_scen_aggregate(
  my_scens,
  agg = rwa1,
  scen_dir = system.file("extdata/Scenario", package ="RWDataPlyr")
)

