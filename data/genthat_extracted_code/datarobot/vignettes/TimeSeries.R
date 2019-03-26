## ---- echo = FALSE-------------------------------------------------------
library(knitr)
kable(data.frame(row = seq(9),
                 time = as.Date("2017-01-02") + seq(9),
                 target = c(16443, 3013, 1643, rep(NA, 6)),
                 temp = c(72, 72, 68, rep(NA, 6))))

## ---- echo = FALSE-------------------------------------------------------
library(knitr)
kable(data.frame(row = seq(9),
                 time = as.Date("2017-01-02") + seq(9),
                 target = c(16443, 3013, 1643, rep(NA, 6)),
                 holiday = c(TRUE, rep(FALSE, 5), TRUE, rep(FALSE, 2))))

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  data <- read.csv("multiseries.csv")
#  project <- SetupProject(dataSource = data, projectName = "test-MultiSeries")
#  partition <- CreateDatetimePartitionSpecification(datetimePartitionColumn = "timestamp",
#                                                    useTimeSeries = TRUE,
#                                                    multiseriesIdColumns = list("series_id"))

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  RequestMultiSeriesDetection(project, "timestamp")
#  SetTarget(project = project,
#  					target = "target",
#  					partition = partition,
#  					metric = "RMSE",
#  					mode = AutopilotMode$Manual,
#  					targetType = "Regression")

