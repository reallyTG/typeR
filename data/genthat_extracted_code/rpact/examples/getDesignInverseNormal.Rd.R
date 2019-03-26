library(rpact)


### Name: getDesignInverseNormal
### Title: Get Design Inverse Normal
### Aliases: getDesignInverseNormal

### ** Examples


# Run with default values
getDesignInverseNormal() 

# The output is
# 
# Design parameters and output of inverse normal design:
# 
# User defined parameters: not available
# 
# Derived from user defined parameters: not available
# 
# Default parameters:
#   Type of design                        : OF 
#   Maximum number of stages              : 3 
#   Stages                                : 1, 2, 3 
#   Information rates                     : 0.333, 0.667, 1.000 
#   Significance level                    : 0.0250 
#   Type II error rate                    : 0.2 
#   Two-sided power                       : FALSE 
#   Delta for Wang & Tsiatis Delta class  : 0 
#   Futility bounds (non-binding)         : -Inf, -Inf 
#   Binding futility                      : FALSE 
#   Haybittle Peto constants              : 3.000 
#   Parameter for alpha spending function : 1 
#   Parameter for beta spending function  : 1 
#   Optimization criterion for optimum design within Wang & Tsiatis class : ASNH1 
#   Test                                  : one-sided 
#   Tolerance                             : 1e-08 
#   Type of beta spending                 : none 
#                                       
# Output:                               
#   Cumulative alpha spending             : 0.0002592, 0.0071601, 0.0250000 
#   Critical values                       : 3.471, 2.454, 2.004 
#   Stage levels                          : 0.0002592, 0.0070554, 0.0225331 
# 

# Calculate the Pocock type alpha spending critical values if the second 
# interim analysis was performed after 70% of information was observed
getDesignInverseNormal(informationRates = c(0.4, 0.7), 
    typeOfDesign = "asP") 

# The output is
#
# Design parameters and output of inverse normal design: 
#
# User defined parameters: 
#   Type of design                        : asP 
#   Stages                                : 1, 2 
#   Information rates                     : 0.400, 0.700 
# 
# Derived from user defined parameters : 
#   Maximum number of stages              : 2 
#   Futility bounds (non-binding)         : -Inf 
# 
# Default parameters: 
#   Significance level                    : 0.0250 
#   Type II error rate                    : 0.2 
#   Delta for Wang & Tsiatis Delta class  : 0 
#   Parameter for alpha spending function : 1 
#   Parameter for beta spending function  : 1 
#   Optimization criterion for Optimum design within Wang & Tsiatis class : ASNH1 
#   Test                                  : one-sided 
#   Tolerance                             : 1e-08 
#   Type of beta                          : none 
# Output: 
#   Cumulative alpha spending             : 0.01308, 0.01974 
#   Critical values                       : 2.224, 2.305 
#   Stage levels                          : 0.01308, 0.01058 




