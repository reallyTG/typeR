## ---- echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(fig.width=7, fig.height=5)

## ------------------------------------------------------------------------
suppressPackageStartupMessages(library(PWFSLSmoke))

# Get some airnow data for Washington state in the summer of 2015
# NOTE:  'tlim' is interpreted as UTC unless we specify 'timezone' 
N_M <- monitor_subset(Northwest_Megafires,
                      tlim=c(20150801,20150831),
                      timezone="America/Los_Angeles")
WA <- monitor_subset(N_M, stateCodes='WA')

# 'ws_monitor' objects can be identified by their class
class(WA)

# Examine the 'meta' dataframe
dim(WA$meta)
rownames(WA$meta)
colnames(WA$meta)

# Examine the 'data' dataframe
dim(WA$data)
colnames(WA$data)

# This should always be true
all(rownames(WA$meta) == colnames(WA$data[,-1]))

## ----magrittr------------------------------------------------------------
# Calculate daily means for the Methow from monitors in Twisp and Winthrop
TwispID <- '530470009_01'
WinthropID <- '530470010_01'
Methow_Valley_JulyMeans <- Northwest_Megafires %>%
  monitor_subset(monitorIDs=c(TwispID,WinthropID)) %>%
  monitor_collapse(monitorID='MethowValley') %>%
  monitor_subset(tlim=c(20150701,20150731), timezone='America/Los_Angeles') %>%
  monitor_dailyStatistic(minHours=18)
# Look at the first week
Methow_Valley_JulyMeans$data[1:7,]

## ------------------------------------------------------------------------
# Use special knowledge of AirNow IDs to subset airnow data for Spokane county monitors
SpokaneCountyIDs <- N_M$meta$monitorID[stringr::str_detect(N_M$meta$monitorID, "^53063")]
Spokane <- monitor_subset(N_M, monitorIDs=SpokaneCountyIDs)

# Apply 3-hr rolling mean
Spokane_3hr <- monitor_rollingMean(Spokane, 3, align="center")

# 1) Replace data columns with their squares (exponentiation is not supplied by the package)
Spokane_3hr_squared <- Spokane_3hr
Spokane_3hr_squared$data[,-1] <- (Spokane_3hr$data[,-1])^2 # exclude the 'datetime' column

# NOTE:  Exponentiation is only used as an example. It does not generate a meaningful result.

# Create a daily averaged 'ws_monitor' object
Spokane_daily_3hr <- monitor_dailyStatistic(Spokane_3hr)

# 2) Check out the correlation between monitors (correlation is not supplied by the package)
data <- Spokane_daily_3hr$data[,-1] # exclude the 'datetime' column
cor(data, use='complete.obs')

