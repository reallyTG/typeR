library(TSdist)


### Name: TSDatabaseDistances
### Title: TSdist distance matrix computation.
### Aliases: TSDatabaseDistances

### ** Examples


# The object example.database is a numeric matrix that saves
# 6 ARIMA time series in a row-wise format. For more information
# see help page of example.databases:

help(example.database)
data(example.database)

# To calculate the distance matrix of this database: 

TSDatabaseDistances(example.database, distance="manhattan")
TSDatabaseDistances(example.database, distance="edr", epsilon=0.2)
TSDatabaseDistances(example.database, distance="fourier", n=20)

# The object zoo.database is a zoo object that saves
# the same 6 ARIMA time series saved in example.database. 

data(zoo.database)

# To calculate the distance matrix of this database: 

TSDatabaseDistances(zoo.database, distance="manhattan")
TSDatabaseDistances(zoo.database, distance="edr", epsilon=0.2)
TSDatabaseDistances(zoo.database, distance="fourier", n=20)




