library(rpact)


### Name: getAnalysisResults
### Title: Get Analysis Results
### Aliases: getAnalysisResults

### ** Examples

design <- getDesignGroupSequential()
dataMeans <- getDataset(
    n = c(10,10),
    means = c(1.96,1.76),
    stDevs = c(1.92,2.01))

getAnalysisResults(design, dataMeans)

# produces:
#
# Analysis results (group sequential design):
#  Stages                        : 1, 2, 3 
#  Information rates             : 0.333, 0.667, 1.000 
#  Critical values               : 3.471, 2.454, 2.004 
#  Futility bounds (non-binding) : -Inf, -Inf 
#  Cumulative alpha spending     : 0.0002592, 0.0071601, 0.0250000 
#  Stage levels                  : 0.0002592, 0.0070554, 0.0225331 
#  Effect sizes                  : 1.96, 1.86, NA 
#  Test statistics               : 3.228, 2.769, NA 
#  p-values                      : 0.005177, 0.010895, NA 
#  Overall test statistics       : 3.228, 4.342, NA 
#  Overall p-values              : 0.0051766, 0.0001757, NA 
#  Futility bounds for power     : NA 
#  Actions                       : continue, reject and stop, NA 
#  Theta H0                      : 0 
#  CRP                           : 0.3177, 0.9434, NA 
#  Planned sample size           : NA, NA, NA 
#  Planned allocation ratio      : 1 
#  Assumed effect                : NA 
#  Assumed standard deviation    : 1 
#  Conditional power             : NA, NA, NA 
#  RCIs (lower)                  : -1.236, 0.702, NA 
#  RCIs (upper)                  : 5.16, 3.02, NA 
#  Repeated p-values             : 0.081766, 0.001825, NA 
#  Final stage                   : 2 
#  Final p-value                 : NA, 0.0004094, NA 
#  Final CIs (lower)             : NA, 0.654, NA 
#  Final CIs (upper)             : NA, 2.36, NA 
#  Median unbiased estimate      : NA, 1.51, NA 




