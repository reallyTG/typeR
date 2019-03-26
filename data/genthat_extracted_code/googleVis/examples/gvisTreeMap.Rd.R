library(googleVis)


### Name: gvisTreeMap
### Title: Google Tree Map with R
### Aliases: gvisTreeMap
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires Internet
## connection to display the visualisation.

Tree <- gvisTreeMap(Regions,  idvar="Region", parentvar="Parent",
                    sizevar="Val", colorvar="Fac")
plot(Tree)


Tree2 <- gvisTreeMap(Regions,  "Region", "Parent", "Val", "Fac",
                    options=list(width=600, height=500,
                                 fontSize=16,
                                 minColor='#EDF8FB',
                                 midColor='#66C2A4',
                                 maxColor='#006D2C',
                                 headerHeight=20,
                                 fontColor='black',
                                 showScale=TRUE))

plot(Tree2)

## Simple static treemap with no drill down options based on US states
## and their area. However we still have to create a parent id to use
## gvisTreeMap
 
require(datasets)
states <- data.frame(state.name, state.area)

## Create parent variable

total=data.frame(state.area=sum(states$state.area), state.name="USA")

my.states <- rbind(total, states)
my.states$parent="USA"
## Set parent variable to NA at root level
my.states$parent[my.states$state.name=="USA"] <- NA

my.states$state.area.log=log(my.states$state.area)
statesTree <- gvisTreeMap(my.states, "state.name", "parent",
                          "state.area", "state.area.log")
plot(statesTree)


## We add US regions to the above data set to enable drill down capabilities

states2 <- data.frame(state.region, state.name, state.area)

regions <- aggregate(list(region.area=states2$state.area),
                     list(region=state.region), sum)

my.states2 <- data.frame(regionid=c("USA",
                                    as.character(regions$region),
                                    as.character(states2$state.name)),
                         parentid=c(NA, rep("USA", 4),
                                   as.character(states2$state.region)),
                         state.area=c(sum(states2$state.area),
                                      regions$region.area, states2$state.area))

my.states2$state.area.log=log(my.states2$state.area)

statesTree2 <- gvisTreeMap(my.states2, "regionid", "parentid",
                           "state.area", "state.area.log")

plot(statesTree2)

## Now we add another layer with US divisions

states3 <- data.frame(state.region, state.division, state.name, state.area)

regions <- aggregate(list(region.area=states3$state.area),
                     list(region=state.region), sum)

divisions <- aggregate(list(division.area=states3$state.area),
                     list(division=state.division, region=state.region),
                     sum)

my.states3 <- data.frame(regionid=c("USA",
                                    as.character(regions$region),
                                    as.character(divisions$division),
                                    as.character(states3$state.name)),
                         parentid=c(NA, rep("USA", 4), 
                                   as.character(divisions$region),
                                   as.character(states3$state.division)),
                         state.area=c(sum(states3$state.area),
                                      regions$region.area,
                                      divisions$division.area,
                                      states3$state.area))

my.states3$state.area.log=log(my.states3$state.area)

statesTree3 <- gvisTreeMap(my.states3, "regionid", "parentid",
                           "state.area", "state.area.log")

plot(statesTree3)






