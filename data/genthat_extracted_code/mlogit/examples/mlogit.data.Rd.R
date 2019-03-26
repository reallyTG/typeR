library(mlogit)


### Name: mlogit.data
### Title: data.frame for logit model
### Aliases: mlogit.data [[<-.mlogit.data $<-.mlogit.data print.pseries
###   index mean.mlogit.data formula.mlogit.data
### Keywords: attribute

### ** Examples


# ModeChoice is a long data.frame 

data("TravelMode", package = "AER")
TM <- mlogit.data(TravelMode, choice = "choice", shape = "long",
                 alt.levels = c("air", "train", "bus", "car"))

# Same but the alt variable called mode is provided

TM <- mlogit.data(TravelMode ,choice = "choice", shape = "long",
                  alt.var = "mode")

# Same but the chid variable called individual is provided

TM <- mlogit.data(TravelMode, choice = "choice",
                  shape = "long", id.var = "individual",
                  alt.levels = c("air", "train", "bus", "car"))

# Same but with two own provided variables

TM <- mlogit.data(TravelMode, choice = "choice", shape = "long",
                 id.var = "individual", alt.var = "mode")

#  Same but with two own provided variables which are deleted from the
#  data.frame

TM <- mlogit.data(TravelMode, choice = "choice", shape = "long",
                 id.var = "individual", alt.var = "mode", drop.index = TRUE)


#  Train is a wide data.frame with columns 'choiceid' is the choice
#  index, the alternatives are named "ch1" and "ch2", the opposite of
#  the variables is returned

data("Train", package = "mlogit")
Train <- mlogit.data(Train, choice = "choice", shape = "wide",
                     varying = 4:11, alt.levels = c("A", "B"), sep = "_",
                     opposite = c("price", "time", "change", "comfort"))


# Car is a wide data.frame

data("Car", package = "mlogit")
Car <- mlogit.data(Car, varying = 5:70, shape = "wide", sep = "",
                   choice = "choice", alt.levels = 1:6)

data("HC", package = "mlogit")
HC <- mlogit.data(HC, choice = "depvar", varying=c(2:8, 10:16), shape="wide")

# Game is a data.frame in wide format for which the response is a
#  ranking variable

data("Game", package = "mlogit")
G <- mlogit.data(Game, shape="wide", varying = 1:12, alt.var = 'platform',
                 drop.index = TRUE, choice="ch", ranked =TRUE)

# Game2 contains the same data, but in long format 
data("Game2", package = "mlogit")
G2 <- mlogit.data(Game2,  shape='long', choice="ch", alt.var = 'platform', ranked = TRUE)



