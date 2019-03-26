library(hybridModels)


### Name: hybridModel
### Title: Hybrid model simulation.
### Aliases: hybridModel

### ** Examples

# Migration model
# Parameters and initial conditions for an SIS model
# loading the data set 
data(networkSample) # help("networkSample"), for more info
networkSample <- networkSample[which(networkSample$Day < "2012-03-20"),]

var.names <- list(from = 'originID', to = 'destinationID', Time = 'Day',
                  arc = 'num.animals')
                  
prop.func <- c('beta * S * I / (S + I)', 'gamma * I')
state.var <- c('S', 'I')
state.change.matrix <- matrix(c(-1,  1,  # S
                                 1, -1), # I
                              nrow = 2, ncol = 2, byrow = TRUE)
                              
model.parms <- c(beta = 0.1, gamma = 0.01)

init.cond <- rep(100, length(unique(c(networkSample$originID,
                                      networkSample$destinationID))))
names(init.cond) <- paste('S', unique(c(networkSample$originID,
                                        networkSample$destinationID)), sep = '')
init.cond <- c(init.cond, c(I36811 = 10, I36812 = 10)) # adding infection
                  
# running simulations, check num of cores available (num.cores)
sim.results <- hybridModel(network = networkSample, var.names = var.names,
                           model.parms = model.parms, state.var = state.var,
                           prop.func = prop.func, init.cond = init.cond,
                           state.change.matrix = state.change.matrix,
                           sim.number = 2, num.cores = 2)

# default plot layout (plot.types: 'pop.mean', 'subpop', or 'subpop.mean')
plot(sim.results, plot.type = 'subpop.mean')

# changing plot layout with ggplot2 (example)
# uncomment the lines below to test new layout exemple
#library(ggplot2)
#plot(sim.results, plot.type = 'subpop') + ggtitle('New Layout') + 
#  theme_bw() + theme(axis.title = element_text(size = 14, face = "italic"))

# Influence model
# Parameters and initial conditions for an SIS model
# loading the data set 
data(networkSample) # help("networkSample"), for more info
networkSample <- networkSample[which(networkSample$Day < "2012-03-20"),]

var.names <- list(from = 'originID', to = 'destinationID', Time = 'Day',
                  arc = 'num.animals')
                  
prop.func <- c('beta * S * (I + i) / (S + I + s + i)', 'gamma * I')
state.var <- c('S', 'I')
infl.var <- c(S = "s", I = "i") # mapping influence
state.change.matrix <- matrix(c(-1,  1,  # S
                                 1, -1), # I
                              nrow = 2, ncol = 2, byrow = TRUE)
                              
model.parms <- c(beta = 0.1, gamma = 0.01)

init.cond <- rep(100, length(unique(c(networkSample$originID,
                                      networkSample$destinationID))))
names(init.cond) <- paste('S', unique(c(networkSample$originID,
                                        networkSample$destinationID)), sep = '')
init.cond <- c(init.cond, c(I36811 = 10, I36812 = 10)) # adding infection
                  
# running simulations, check num of cores available (num.cores)
# Uncomment to run
# sim.results <- hybridModel(network = networkSample, var.names = var.names,
#                            model.parms = model.parms, state.var = state.var,
#                            infl.var = infl.var, prop.func = prop.func,
#                            init.cond = init.cond,
#                            state.change.matrix = state.change.matrix,
#                            sim.number = 2, num.cores = 2)

# default plot layout (plot.types: 'pop.mean', 'subpop', or 'subpop.mean')
# plot(sim.results, plot.type = 'subpop.mean')




