library(RWDataPlyr)
library(dplyr)
library(tidyr)

context('check RWDataPlyr:::processSlots aggregation computations')

# -----------------------------------
# hand compute values
# keyRdf exists as data in package
mReg <- rdf_get_slot(keyRdf, "Mead.Pool Elevation")
pReg <- rdf_get_slot(keyRdf, "Powell.Outflow")
lbShort <- as.data.frame(rdf_get_slot(
  sysRdf, 
  "SummaryOutputData.LBShortageConditions"
))
cNames <- seq_len(ncol(mReg))
colnames(mReg) <- cNames
colnames(pReg) <- cNames
colnames(lbShort) <- cNames

mEocy <- as.data.frame(mReg[seq(12,nrow(mReg), 12),])
pMin <- as.data.frame(rwslot_annual_min(pReg))
pEowy <- as.data.frame(pReg[seq(9,nrow(pReg),12),])
mBocy <- as.data.frame(mReg[seq(1, nrow(mReg), 12),])
mMax <- as.data.frame(rwslot_annual_max(mReg))
mSum <- as.data.frame(rwslot_annual_sum(mReg))
p800 <- as.data.frame((rwslot_annual_min(pReg) <= 800000) * 1)

pPad <- rbind(pReg[1,], pReg[1,], pReg[1,], pReg)[seq_len(nrow(pReg)),]
attr(pPad, "timespan") <- c("October 2000", "September 2004")
p750 <- as.data.frame((rwslot_annual_min(pPad) <= 750000) * 1)

p500 <- as.data.frame((rwslot_annual_max(pPad) <= 500000) * 1)

m1050 <- as.data.frame((mReg[seq(12,nrow(mReg),12),] <= 1050) * 1)

m1100 <- as.data.frame((mReg[seq(12,nrow(mReg),12),] >= 1100) * 1)


filterVarToMatrix <- function(zz, var, scen = "ISM1988_2014,2007Dems,IG,Most") {
  zz %>% 
    filter(Variable == var, Scenario == scen) %>%
    select(-Scenario, -Variable) %>%
    arrange(Year) %>%
    spread(Trace, Value) %>%
    select(-Year)
}

# ---------------------------------------
# create a sal that tests every one of the agg methods
sal <- slot_agg_list(matrix(c(
  "KeySlots.rdf", "Powell.Outflow", "AnnMin", NA, "powellMin",
  "KeySlots.rdf", "Powell.Outflow", "EOWY", NA, "powellEowy",
  "KeySlots.rdf", "Mead.Pool Elevation", "EOCY", NA, "meadPe",
  "KeySlots.rdf", "Mead.Pool Elevation", "BOCY", NA, "meadBocy",
  "KeySlots.rdf", "Mead.Pool Elevation", "AnnMax", NA, "meadMax",
  "KeySlots.rdf", "Mead.Pool Elevation", "AnnualSum", NA, "meadSum",
  "KeySlots.rdf", "Powell.Outflow", "AnnMinLTE", 800000, "powellLt800",
  "KeySlots.rdf", "Powell.Outflow", "WYMinLTE", 750000, "powellLt750",
  "KeySlots.rdf", "Powell.Outflow", "WYMaxLTE", 500000, "powellLt500",
  "KeySlots.rdf", "Mead.Pool Elevation", "EOCYLTE", 1050, "meadLt1050",
  "KeySlots.rdf", "Mead.Pool Elevation", "EOCYGTE", 1100, "meadGt1100",
  "KeySlots.rdf", "Mead.Pool Elevation", "AnnualRaw", NA, "meadPe2",
  "SystemConditions.rdf", "SummaryOutputData.LBShortageConditions", "AnnualRaw",
    NA, "lbShort"), 
  ncol = 5, byrow = TRUE
))

# for now have to process monthly seperately
salMonthly <- slot_agg_list(matrix(c(
  "KeySlots.rdf", "Powell.Outflow", "Monthly", 10, "powellMothly10",
  "KeySlots.rdf", "Mead.Pool Elevation", "Monthly", .001, "meadMonthly001"),
  ncol = 5, byrow = TRUE
))

zzMonthly <- expect_warning(
    getDataForAllScens(
    scenFolders = "ISM1988_2014,2007Dems,IG,Most", 
    scenNames = "ISM1988_2014,2007Dems,IG,Most", 
    slotAggList = salMonthly,
    scenPath = system.file('extdata','Scenario/',package = 'RWDataPlyr'),
    retFile = TRUE
  ) %>%
    mutate(monthNum = match(Month, month.name))
)
# compare the results computed by getDataForAllScen -> processSlots
# to those computed by hand using rdf_get_slot
test_that("processSlots monthly to annual aggregation methods work", {
  expect_warning(
    zz <- getDataForAllScens(
      scenFolders = "ISM1988_2014,2007Dems,IG,Most", 
      scenNames = "ISM1988_2014,2007Dems,IG,Most", 
      slotAggList = sal, 
      scenPath = system.file('extdata','Scenario/',package = 'RWDataPlyr'),
      retFile = TRUE
    )
  )
  expect_equal(filterVarToMatrix(zz, "powellMin"), pMin)
  expect_equal(filterVarToMatrix(zz, "powellEowy"), pEowy)
  expect_equal(filterVarToMatrix(zz, "meadPe"), mEocy)
  expect_equal(filterVarToMatrix(zz, "meadBocy"), mBocy)
  expect_equal(filterVarToMatrix(zz, "meadMax"), mMax)
  expect_equal(filterVarToMatrix(zz, "meadSum"), mSum)
  expect_equal(filterVarToMatrix(zz, "powellLt800"), p800)
  expect_equal(filterVarToMatrix(zz, "powellLt750"), p750)
  expect_equal(filterVarToMatrix(zz, "powellLt500"), p500)
  expect_equal(filterVarToMatrix(zz, "meadLt1050"), m1050)
  expect_equal(filterVarToMatrix(zz, "meadGt1100"), m1100)
  expect_equal(filterVarToMatrix(zz, "powellMin"), pMin)
  expect_equal(filterVarToMatrix(zz, "meadPe2"), mEocy)
  expect_equal(
    filterVarToMatrix(zz, "meadPe2"), 
    filterVarToMatrix(zz, "meadPe")
  )
  expect_equal(filterVarToMatrix(zz, "lbShort"), lbShort)
  expect_equal({
    zzMonthly %>% 
      filter(
        Variable == "powellMothly10", 
        Scenario == "ISM1988_2014,2007Dems,IG,Most"
      ) %>%
      select(-Scenario, -Variable, -Month) %>%
      arrange(Year,monthNum) %>%
      spread(Trace, Value) %>%
      select(-Year, -monthNum)
  }, as.data.frame(pReg * 10))
  
  expect_equal({
    zzMonthly %>% 
      filter(
        Variable == "meadMonthly001", 
        Scenario == "ISM1988_2014,2007Dems,IG,Most"
      ) %>%
      select(-Scenario, -Variable, -Month) %>%
      arrange(Year,monthNum) %>%
      spread(Trace, Value) %>%
      select(-Year, -monthNum)
  }, as.data.frame(mReg * 0.001))
})


# -----------------------------------
# and check all of them for a single trace

# hand compute values
# keyRdf exists as data in package
key <- read.rdf(system.file(
  "extdata/Scenario/T13,CT,IG", 
  "KeySlots.rdf", 
  package = "RWDataPlyr"
))
mReg <- rdf_get_slot(key, "Mead.Pool Elevation")
pReg <- rdf_get_slot(key, "Powell.Outflow")
sys <- read.rdf(system.file(
  "extdata/Scenario/T13,CT,IG", 
  "SystemConditions.rdf", package = "RWDataPlyr"
))
lbShort <- as.data.frame(rdf_get_slot(
  sys, 
  "SummaryOutputData.LBShortageConditions"
))
cNames <- seq_len(ncol(mReg))
colnames(mReg) <- cNames
colnames(pReg) <- cNames
colnames(lbShort) <- cNames

mEocy <- as.data.frame(mReg[seq(12,nrow(mReg), 12),, drop = FALSE])
pMin <- as.data.frame(rwslot_annual_min(pReg))
pEowy <- as.data.frame(pReg[seq(9,nrow(pReg),12),, drop = FALSE])
mBocy <- as.data.frame(mReg[seq(1, nrow(mReg), 12),, drop = FALSE])
mMax <- as.data.frame(rwslot_annual_max(mReg))
mSum <- as.data.frame(rwslot_annual_sum(mReg))
p800 <- as.data.frame((rwslot_annual_min(pReg) <= 800000) * 1)

pPad <- rbind(
  pReg[1,], 
  pReg[1,], 
  pReg[1,], pReg
)[seq_len(nrow(pReg)),, drop = FALSE]
attr(pPad, "timespan") <- c("October 2000", "September 2004")
p750 <- as.data.frame((rwslot_annual_min(pPad) <= 750000) * 1)

p500 <- as.data.frame((rwslot_annual_max(pPad) <= 500000) * 1)

m1050 <- as.data.frame((mReg[seq(12,nrow(mReg),12),, drop = FALSE] <= 1050) * 1)

m1100 <- as.data.frame((mReg[seq(12,nrow(mReg),12),, drop = FALSE] >= 1100) * 1)

stScen <- "T13,CT,IG"

zzMonthly <- expect_warning(
  getDataForAllScens(
    scenFolders = stScen, 
    scenNames = stScen, 
    slotAggList = salMonthly,
    scenPath = system.file('extdata','Scenario/',package = 'RWDataPlyr')
  ) %>%
    mutate(monthNum = match(Month, month.name))
)

test_that("processSlots mon to ann agg methods work for rdf with 1 trace", {
  expect_warning(
    zz <- getDataForAllScens(
      scenFolders = stScen, 
      scenNames = stScen, 
      slotAggList = sal, 
      scenPath = system.file('extdata','Scenario/',package = 'RWDataPlyr'),
      retFile = TRUE
    )
  )

  expect_equal(filterVarToMatrix(zz, "powellMin", stScen), pMin)
  expect_equal(filterVarToMatrix(zz, "powellEowy", stScen), pEowy)
  expect_equal(filterVarToMatrix(zz, "meadPe", stScen), mEocy)
  expect_equal(filterVarToMatrix(zz, "meadBocy", stScen), mBocy)
  expect_equal(filterVarToMatrix(zz, "meadMax", stScen), mMax)
  expect_equal(filterVarToMatrix(zz, "meadSum", stScen), mSum)
  expect_equal(filterVarToMatrix(zz, "powellLt800", stScen), p800)
  expect_equal(filterVarToMatrix(zz, "powellLt750", stScen), p750)
  expect_equal(filterVarToMatrix(zz, "powellLt500", stScen), p500)
  expect_equal(filterVarToMatrix(zz, "meadLt1050", stScen), m1050)
  expect_equal(filterVarToMatrix(zz, "meadGt1100", stScen), m1100)
  expect_equal(filterVarToMatrix(zz, "powellMin", stScen), pMin)
  expect_equal(filterVarToMatrix(zz, "meadPe2", stScen), mEocy)
  expect_equal(
    filterVarToMatrix(zz, "meadPe2", stScen), 
    filterVarToMatrix(zz, "meadPe", stScen)
  )
  expect_equal(filterVarToMatrix(zz, "lbShort", stScen), lbShort)
  expect_equal({
    zzMonthly %>% 
      filter(Variable == "powellMothly10", Scenario == stScen) %>%
      select(-Scenario, -Variable, -Month) %>%
      arrange(Year,monthNum) %>%
      spread(Trace, Value) %>%
      select(-Year, -monthNum)
  }, as.data.frame(pReg * 10))
  
  expect_equal({
    zzMonthly %>% 
      filter(Variable == "meadMonthly001", Scenario == stScen) %>%
      select(-Scenario, -Variable, -Month) %>%
      arrange(Year,monthNum) %>%
      spread(Trace, Value) %>%
      select(-Year, -monthNum)
  }, as.data.frame(mReg * 0.001))
})

