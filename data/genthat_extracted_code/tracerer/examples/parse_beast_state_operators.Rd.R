library(tracerer)


### Name: parse_beast_state_operators
### Title: Parses a BEAST2 .xml.state output file to get only the operators
###   acceptances
### Aliases: parse_beast_state_operators

### ** Examples

  xml_state_filename <- get_tracerer_path("beast2_example_output.xml.state")
  estimates <- parse_beast_state_operators(filename = xml_state_filename)
  expected_names <- c("operator", "p", "accept", "reject", "acceptFC",
    "rejectFC", "rejectIv", "rejectOp")
  expected_operator <- c("treeScaler.t", "treeRootScaler.t",
    "UniformOperator.t", "SubtreeSlide.t", "narrow.t", "wide.t",
    "WilsonBalding.t", "BirthRateScaler.t", "DeathRateScaler.t")
  testit::assert(names(estimates) == expected_names)
  #testit::assert(estimates$operator == expected_operators)



