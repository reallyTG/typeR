library(tracerer)


### Name: parse_beast_log
### Title: Parses a BEAST2 '.log' output file
### Aliases: parse_beast_log

### ** Examples

  log_filename <- get_tracerer_path("beast2_example_output.log")
  estimates <- parse_beast_log(filename = log_filename)
  expected_names <- c(
    "Sample", "posterior", "likelihood",
    "prior", "treeLikelihood", "TreeHeight",
    "BirthDeath", "birthRate2", "relativeDeathRate2"
  )
  testit::assert(names(estimates) == expected_names)



