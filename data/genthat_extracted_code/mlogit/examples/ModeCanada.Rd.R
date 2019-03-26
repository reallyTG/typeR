library(mlogit)


### Name: ModeCanada
### Title: Mode Choice for the Montreal-Toronto Corridor
### Aliases: ModeCanada
### Keywords: datasets

### ** Examples

data("ModeCanada", package = "mlogit")
bususers <- with(ModeCanada, case[choice == 1 & alt == "bus"])
ModeCanada <- subset(ModeCanada, ! case %in% bususers)
ModeCanada <- subset(ModeCanada, noalt == 4)
ModeCanada <- subset(ModeCanada, alt != "bus")
ModeCanada$alt <- ModeCanada$alt[drop = TRUE]
KoppWen00 <- mlogit.data(ModeCanada, shape='long', chid.var = 'case',
                         alt.var = 'alt', choice='choice',
                         drop.index=TRUE)
pcl <- mlogit(choice~freq+cost+ivt+ovt, KoppWen00, reflevel='car',
              nests='pcl', constPar=c('iv.train.air'))






