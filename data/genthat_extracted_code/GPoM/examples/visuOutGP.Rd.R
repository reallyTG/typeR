library(GPoM)


### Name: visuOutGP
### Title: visuOutGP : get a quick information of gPoMo output
### Aliases: visuOutGP

### ** Examples

# load data
data("Ross76")
# # time vector
tin <- Ross76[seq(1, 3000, by = 8), 1]
# single time series
data <- Ross76[seq(1, 3000, by = 8), 3]
dev.new()
plot(tin, data, type = 'l')
# global modelling
# results are put in list outputGPoM
outputGPoM <- gPoMo(data, tin=tin, dMax = 2, nS=c(3), show = 0,
                    nPmin = 9, nPmax = 12, method = 'rk4',
                    IstepMin = 200, IstepMax = 201)
visuOutGP(outputGPoM)




