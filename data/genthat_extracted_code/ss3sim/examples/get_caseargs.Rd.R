library(ss3sim)


### Name: get_caseargs
### Title: Take a scenario ID and return argument lists
### Aliases: get_caseargs

### ** Examples

# Find the example data folders:
case_folder <- system.file("extdata", "eg-cases", package =
  "ss3sim")

# An example using the cases defined by default:
get_caseargs(case_folder, scenario = "D0-F0-cod")

# With a custom time-varying case for selectivity, which we'll call
# the S case. Here, we'll need to define which file the case S should
# read from ("S*-cod.txt"):
get_caseargs(case_folder, scenario = "D0-E0-F0-M0-R0-S0-cod",
  case_files = list(E = "E", D = c("index", "lcomp", "agecomp"), F =
    "F", M = "M", R = "retro", S = "S"))



