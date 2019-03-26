library(geoscale)


### Name: geoscalePlot
### Title: Geological time scale plotting.
### Aliases: geoscalePlot
### Keywords: time-series,plot

### ** Examples


### Basic plots

data(traits)
attach(traits)

## 1. A simple bivariant plot
 geoscalePlot(age,trait)

## 2. Including the entire time scale
 geoscalePlot(age,trait,units=c("Eon","Era","Age","Epoch","Period"),type="l")
 
## 3. Including abbreviations in the time scale
 # (a) For one or more temporal units
  geoscalePlot(age,trait,units=c("Eon","Era","Age","Epoch","Period"),type="l",
   abbrev=c("Age","Epoch"))
 # (b) For all temporal units
  geoscalePlot(age,trait,units=c("Eon","Era","Age","Epoch","Period"),type="l",
   abbrev=c("All"))

## 4. Rotating names in the time scale
  geoscalePlot(age,trait,units=c("Eon","Era","Age","Epoch","Period"),type="l",
   erotate=45)

### Including a user defined timescale

data(traits)
 attach(traits)
  data(biozones)

geoscalePlot(age,trait,boxes="User",user.scale=biozones,type="o",
 units=c("Age","Period","User"),xlim=c(65,95),tick.scale="User")
 



