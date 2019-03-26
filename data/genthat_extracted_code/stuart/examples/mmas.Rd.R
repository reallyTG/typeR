library(stuart)


### Name: mmas
### Title: Subtest construction using the Max-Min-Ant-System
### Aliases: mmas

### ** Examples

# MMAS in a simple situation
# requires lavaan
# number of cores set to 1 in all examples
data(fairplayer)
fs <- list(si = names(fairplayer)[83:92])

# minimal example
sel <- mmas(fairplayer, fs, 4, 
  colonies = 0, ants = 10,  # minimal runtime, remove for application
  seed = 55635, cores = 1)
summary(sel)

## No test: 
# longitudinal example
data(fairplayer)
fs <- list(si1 = names(fairplayer)[83:92],
  si2 = names(fairplayer)[93:102],
  si3 = names(fairplayer)[103:112])

repe <- list(si = c('si1', 'si2', 'si3'))

# change evaporation rate after 10 and 20 colonies
sel <- mmas(fairplayer, fs, 4, 
  repeated.measures = repe, long.invariance = 'strong',
  evaporation = cbind(c(0, 10, 20), c(.95, .8, .5)),
  seed = 55635, cores = 1)

# adding a predictor variable to selection model (using lavaan)
data(fairplayer)
fs <- list(si = names(fairplayer)[83:92])

add <- 'si ~ IGS'

sel <- mmas(fairplayer, fs, 4,
  auxiliary = 'IGS',
  analysis.options = list(model = add),
  seed = 55635, cores = 1)

# inspect regression (in lavaan)
lavaan::coef(sel$final)

# same example, maximizing regression weight
obj <- function(chisq, df, pvalue, rmsea, srmr, beta) {
  beta[1, 'IGS']
}

sel <- mmas(fairplayer, fs, 4,
  auxiliary = 'IGS',
  analysis.options = list(model = add),
  objective = obj,
  seed = 55635, cores = 1)
  
# inspect regression (in lavaan)
lavaan::coef(sel$final)
## End(No test)




