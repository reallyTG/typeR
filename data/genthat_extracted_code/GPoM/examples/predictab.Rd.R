library(GPoM)


### Name: predictab
### Title: Estimate the models performance obtained with 'GPoMo' in term of
###   predictability
### Aliases: predictab

### ** Examples

# load data
data("Ross76")
# time vector
tin <- Ross76[seq(1, 3000, by = 8), 1]
# single time series
data <- Ross76[seq(1, 3000, by = 8), 3]
# dev.new()
# plot(tin, data, xlab = 'time', ylab = 'y(t)')

# global modelling
# results are put in list outputGPoM
outputGPoM <- gPoMo(data[1:300], tin = tin[1:300], dMax = 2, nS=c(3),
                    show = 0, method = 'rk4',
                    nPmin = 10, nPmax = 12,
                    IstepMin = 150, IstepMax = 151)
#
visuOutGP(outputGPoM)

###########################
# and test predictability #
###########################
outpred <- predictab(outputGPoM, hp = 15, Nech = 30)

# manual visualisation of the outputs (e.g. for model 1):
dev.new()
image(outpred$tE, outpred$hpE, t(outpred$Errmod1),
xlab = 't', ylab = 'hp', main = 'Errmod1')




