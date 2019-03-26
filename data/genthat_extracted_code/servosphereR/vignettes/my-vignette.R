## ---- include = FALSE----------------------------------------------------
library(data.table)
library(magrittr)
library(servosphereR)

## ---- include = FALSE, echo = FALSE--------------------------------------
servosphere_data <- read.csv2("317_03212018_servosphere.csv")

## ---- echo = FALSE, eval = TRUE------------------------------------------
head(servosphere_data, n = 4)

## ---- include = FALSE----------------------------------------------------
servosphere_data <- getFiles(path = ".", pattern = "_servosphere")

## ---- eval = FALSE, echo = TRUE------------------------------------------
#  servosphere_data <- getFiles(path = "C:/Users/Jake/thesis_project/servosphere_data",
#                               pattern = "_servosphere")

## ---- eval = TRUE, echo = TRUE-------------------------------------------
servosphere_data <- cleanNames(list = servosphere_data,
                               colnames = c("stimulus",
                                            "dT",
                                            "dx",
                                            "dy"))
head(servosphere_data[[1]], n = 4) # Return the first 4 rows of the 1st file in the list

## ---- echo = FALSE, eval = TRUE------------------------------------------
experiment_info <- read.csv("trial_id.csv")

## ---- echo = TRUE, eval = TRUE-------------------------------------------
head(experiment_info) 

## ---- echo = TRUE, eval = TRUE-------------------------------------------
servosphere_data <- mergeTrialInfo(list = servosphere_data,
                                  trial.data = experiment_info,
                                  col.names = c("id", "treatment"),
                                  stimulus.keep = c(0, 1, 2))
head(servosphere_data[[1]], n = 4) # Return the first 4 rows of the 1st file in the list

## ---- echo = FALSE, eval = TRUE------------------------------------------
servosphere_data <- getFiles(path = ".", pattern = "_servosphere") %>%
   cleanNames(colnames = c("stimulus",
                           "dT",
                           "dx", 
                           "dy"))

## ---- echo = TRUE, eval = TRUE-------------------------------------------
servosphere_data <- mergeTrialInfo(list = servosphere_data,
                                   trial.data = experiment_info,
                                   col.names = c("id", "treatment"),
                                   stimulus.keep = c(1))
head(servosphere_data[[1]], n = 4)

## ---- echo = FALSE, eval = TRUE------------------------------------------
experimental_info_stim_split <- read.csv("trial_id_stimulus.csv") %>% 
   dplyr::arrange(id)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
head(experimental_info_stim_split)

## ---- echo = FALSE, eval = TRUE------------------------------------------
servosphere_data <- getFiles(path = ".", pattern = "_servosphere") %>%
   cleanNames(colnames = c("stimulus",
                           "dT",
                           "dx", 
                           "dy"))

## ---- echo = TRUE, eval = TRUE-------------------------------------------
servosphere_data <- mergeTrialInfo(list = servosphere_data,
                                   trial.data = experimental_info_stim_split,
                                   col.names = c("id_stim", "treatment"),
                                   stimulus.keep = c(1, 2),
                                   stimulus.split = TRUE)
head(servosphere_data[[1]], n = 4)

## ---- echo = FALSE, eval = TRUE------------------------------------------
servosphere_data <- getFiles(path = ".", pattern = "_servosphere") %>%
   cleanNames(colnames = c("stimulus",
                           "dT",
                           "dx", 
                           "dy")) %>% 
   mergeTrialInfo(trial.data = experiment_info,
                  col.names = c("id", "treatment"),
                  stimulus.keep = c(1))

## ---- echo = TRUE, eval = TRUE-------------------------------------------
servosphere_data <- aggregateData(list = servosphere_data, n = 60)
head(servosphere_data[[1]], n = 4)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
servosphere_data <- servosphere_data %>% 
   calcXY() %>% 
   calcDistance() %>% 
   calcBearing() %>% 
   calcTurnAngle() %>% 
   calcTurnVelocity() %>% 
   calcVelocity()

head(servosphere_data[[1]]) # Displays first rows of 1st dataframe in list

## ---- echo = TRUE, eval = TRUE-------------------------------------------
summary_data_frame <- summaryTotalDistance(list = servosphere_data,
                                           summary.df = NA)

summary_data_frame

## ---- echo = TRUE, eval = TRUE-------------------------------------------
summary_data_frame <- summaryNetDisplacement(list = servosphere_data,
                                             summary.df = summary_data_frame)
summary_data_frame

## ---- echo = TRUE, eval = TRUE-------------------------------------------
summary_data_frame <- summaryTortuosity(summary.df = summary_data_frame,
                                        total.distance = total_distance,
                                        net.displacement = net_displacement,
                                        inverse = FALSE)
summary_data_frame

## ---- echo = TRUE, eval = TRUE-------------------------------------------
summary_data_frame <- summaryStops(list = servosphere_data,
                                   summary.df = summary_data_frame,
                                   stop.threshold = 0.1)
summary_data_frame

## ---- echo = TRUE, eval = TRUE-------------------------------------------
summary_data_frame <- summaryAvgBearing(list = servosphere_data,
                                        summary.df = summary_data_frame)

summary_data_frame <- summaryAvgVelocity(list = servosphere_data,
                                         summary.df = summary_data_frame)

summary_data_frame

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  # Get files, clean file column names, and merge relevant experimental info
#  servosphere_data <- getFiles(path = ".", pattern = "_servosphere") %>%
#     cleanNames(colnames = c("stimulus",
#                             "dT",
#                             "dx",
#                             "dy")) %>%
#     mergeTrialInfo(trial.data = experiment_info,
#                    col.names = c("id", "treatment"),
#                    stimulus.keep = c(1)) %>%
#     aggregateData(n = 100) %>%
#     # Calculate derived movement variables
#     calcDistance() %>%
#     calcBearing() %>%
#     calcTurnAngle() %>%
#     calcTurnVelocity() %>%
#     calcVelocity()
#  
#  # Summarize derived variables
#  summary_data_frame <- summaryTotalDistance(list = servosphere_data,
#                                             summary.df = NA)
#  
#  summary_data_frame <- summaryNetDisplacement(list = servosphere_data,
#                                               summary.df = summary_data_frame)
#  
#  summary_data_frame <- summaryTortuosity(summary.df = summary_data_frame,
#                                          total.distance = total_distance,
#                                          net.displacement = net_displacement,
#                                          inverse = FALSE)
#  
#  summary_data_frame <- summaryStops(list = servosphere_data,
#                                     summary.df = summary_data_frame,
#                                     stop.threshold = 0.1)
#  
#  summary_data_frame <- summaryStops(list = servosphere_data,
#                                     summary.df = summary_data_frame,
#                                     stop.threshold = 0.1)
#  
#  summary_data_frame <- summaryAvgBearing(list = servosphere_data,
#                                          summary.df = summary_data_frame)
#  
#  summary_data_frame <- summaryAvgVelocity(list = servosphere_data,
#                                           summary.df = summary_data_frame)

