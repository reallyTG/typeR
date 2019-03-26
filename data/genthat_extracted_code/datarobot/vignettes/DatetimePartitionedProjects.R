## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  library(datarobot)

## ----datetime Partition Base, echo = TRUE, eval = FALSE------------------
#  lending_dat <- read.csv("lendingClub.csv")
#  proj        <- SetupProject(dataSource= lending_dat, projectName = "Lending_Club_Time_Series")
#  partition <- CreateDatetimePartitionSpecification(datetimePartitionColumn = "earliest_cr_line",
#                                                    numberOfBacktests = 5)
#  SetTarget(project = proj, target = "is_bad", mode = "quick", partition = partition)

## ----backtest_specification_example, echo = TRUE, eval = FALSE-----------
#  backtest <- list()
#  # Dates are not project specific but rather example dates
#  backtest[[1]] <- CreateBacktestSpecification(0, ConstructDurationString(),
#                                               "1989-12-01", ConstructDurationString(days = 100))
#  backtest[[2]] <- CreateBacktestSpecification(1, ConstructDurationString(), "1999-10-01",
#                                               ConstructDurationString(days = 100))
#  # create desired partition specification
#  partition <- CreateDatetimePartitionSpecification("earliest_cr_line",
#                                                    numberOfBacktests = 2,
#                                                    backtests = backtest)

## ----model_iteration, echo = TRUE, eval = FALSE--------------------------
#  # Request more granular information on the datetime partition specification
#  GetDatetimePartition(proj)
#  
#  # View blueprints associated with a project
#  bps <- ListBlueprints(proj)
#  
#  # View the the models within the model leaderboard
#  models <- ListModels(proj)
#  
#  # Retrieve a datetime model. There is now a new retrieval function specific to datetime partitioning
#  dt_model <- GetDatetimeModelObject(proj, models[[1]]$modelId)
#  
#  # Score all Backtests
#  scoreJobId <- ScoreBacktests(dt_model)
#  WaitForJobToComplete(proj, scoreJobId) # To make synchronous
#  
#  # now model information will also contain information about backtest scores
#  dtModelWithBt <- GetDatetimeModelObject(proj, dt_model$modelId)
#  
#  # Retrain a model using a different start & end date.
#  # One has to request a `Frozen` model to keep the hyper-parameters static and avoid lookahead bias.
#  # Within the context of deployment, this can be used to retrain a resulting model on more recent data.
#  UpdateProject(proj, holdoutUnlocked = TRUE) # If retraining on 100% of the data, we need to unlock the holdout set.
#  modelJobId_frozen   <- RequestFrozenDatetimeModel(dt_model,
#                                                    trainingStartDate = as.Date("1950/12/1"),
#                                                    trainingEndDate = as.Date("1998/3/1"))
#  new_dt_model_frozen <- GetDatetimeModelFromJobId(proj, modelJobId_frozen)
#  
#  # Train & retrieve a new date-time model based on rowcount
#  modelJobId  <- RequestNewDatetimeModel(proj, bps[[1]], trainingRowCount = 100)
#  new_dt_model <- GetDatetimeModelFromJobId(proj, modelJobId)
#  
#  # Train & retrieve a new date-time model based on duration
#  modelJobId   <- RequestNewDatetimeModel(proj, bps[[1]],
#                                          trainingDuration = ConstructDurationString(months=10))
#  new_dt_model <- GetDatetimeModelFromJobId(proj, modelJobId)

