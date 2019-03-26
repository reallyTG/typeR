cat("\ntest of bboptim compatibility:")

if (requireNamespace("blackbox",quietly=TRUE)) {
  blackbox::blackbox.options(spaMM.options("example_maxtime"))
  #blackbox.options(example_maxtime=5) ## allows basic example
  example("bboptim",package="blackbox") ## detected calcpredVar issue for etaFix   
}