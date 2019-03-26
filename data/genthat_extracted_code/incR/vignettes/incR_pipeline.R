## ----eval = TRUE---------------------------------------------------------
library("incR")
data("incR_rawdata")  # loading the data
head(incR_rawdata)

## ----eval = TRUE---------------------------------------------------------
incR_rawdata_prep <- incRprep(data = incR_rawdata,
                              date.name = "DATE",
                              date.format= "%d/%m/%Y %H:%M",
                              timezone="GMT",
                              temperature.name="temperature")
head(incR_rawdata_prep, 3)

## ----eval = TRUE---------------------------------------------------------
data(incR_envdata)  # environmental data
head (incR_envdata)

# then use incRenv to merge environmental data
incR_data <- incRenv (data.nest = incR_rawdata_prep,     # data set prepared by incRprep
                      data.env = incR_envdata, 
                      env.temperature.name = "env_temperature", 
                      env.date.name = "DATE", 
                      env.date.format = "%d/%m/%Y %H:%M", 
                      env.timezone = "GMT")

head (incR_data, 3)

## ------------------------------------------------------------------------
incubation.analysis <- incRscan (data=incR_data, 
                                   temp.name="temperature",
                                   lower.time=22,
                                   upper.time=3,
                                   sensitivity=0.15,
                                   temp.diff.threshold =5,
                                   maxNightVariation=2,
                                   env.temp="env_temp")

## ------------------------------------------------------------------------
names(incubation.analysis)

# incRscan output
head(incubation.analysis$incRscan_data)
head(incubation.analysis$incRscan_threshold)

## ------------------------------------------------------------------------
my_plot <- incRplot(data = incubation.analysis$incRscan_data,
                     time.var = "dec_time", 
                     day.var = "date", 
                     inc.temperature.var = "temperature", 
                     env.temperature.var = "env_temp",
                     vector.incubation = "incR_score")

# a ggplot plot is created that can be modified by the user
my_plot + ggplot2::labs(x = "Time", y = "Temperature")

## ------------------------------------------------------------------------
incRatt(data = incubation.analysis[[1]], vector.incubation = "incR_score")

## ------------------------------------------------------------------------
incRact(data = incubation.analysis[[1]],
             time_column = "time",
             vector.incubation = "incR_score")

## ----eval = TRUE---------------------------------------------------------
incRt(data = incubation.analysis[[1]], 
      temp.name = "temperature", 
      limits = c(5,21),                 # time window
      coor = NULL, 
      activity.times = FALSE, 
      civil.twilight = FALSE, 
      time.zone = NULL)              

## ----eval = TRUE---------------------------------------------------------
incRt(data = incubation.analysis[[1]], 
      temp.name = "temperature", 
      limits = NULL,                 
      coor = NULL, 
      activity.times = TRUE,          # incRact is called to define time window
      civil.twilight = FALSE, 
      time.zone = "GMT",
      time_column= "time",
      vector.incubation="incR_score")              

## ----eval = TRUE---------------------------------------------------------
incRt(data = incubation.analysis[[1]], 
      temp.name = "temperature", 
      limits = NULL,                 
      coor = c(39.5, 40.5),          # choose your coordinates
      activity.times = FALSE, 
      civil.twilight = TRUE, 
      time.zone = "GMT")

## ----eval = TRUE---------------------------------------------------------
bouts <- incRbouts(data = incubation.analysis[[1]], 
                   vector.incubation = "incR_score",
                   sampling.rate = incubation.analysis[[1]]$dec_time[56] - incubation.analysis[[1]]$dec_time[55],   # sampling interval
                   dec_time = "dec_time",
                   temp = "temperature")

# the results are in two tables
names(bouts)

# bouts per day
head(bouts$day_bouts)

# bout specific data
head(bouts$total_bouts)

