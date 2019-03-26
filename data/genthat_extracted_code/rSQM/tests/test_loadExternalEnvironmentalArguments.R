## Not a very sufficient test, but it at least checks that
## the entire integrated pipeline runs end to end
test.LoadYaml <- function(){

  spl_env <- system.file("extdata", "rSQM.yaml", package = "rSQM")
  checkEquals(file.copy(spl_env, getwd()), TRUE)
}
