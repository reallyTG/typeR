library(phybreak)
context("phybreak construction")

test_that("use.tree works correctly", {
  set.seed(0)
  sim1 <- sim.phybreak(5)
  pbo1 <- phybreak(sim1, use.tree = TRUE)
  # set.seed(0)
  # sim2 <- sim.phybreak(5, output.class = "obkData")
  # pbo2 <- suppressWarnings(phybreak(sim2, use.tree = TRUE))
  
  expect_equal(pbo1$v$nodehosts[10:14], 
               match(sim1$sim.infectors, c("index", paste0("host.", 1:5))) - 1)
  expect_equal(pbo1$d$reference.date, 
               min(sim1$sample.times))
  expect_equal(pbo1$d$reference.date + pbo1$v$nodetimes[1:9], 
               sim1$sim.tree$root.edge + ape::node.depth.edgelength(sim1$sim.tree))
  # expect_equal(pbo2$v$nodehosts[10:14], 
  #              match(OutbreakTools::get.data(sim2 , "infector"), c("index", paste0("host.", 1:5))) - 1)
  # expect_equal(pbo2$d$reference.date, 
  #              min(OutbreakTools::get.dates(sim2, "dna")))
  # expect_equal(as.numeric(pbo2$d$reference.date + pbo1$v$nodetimes[1:9]) - 10957, 
  #              OutbreakTools::get.trees(sim2)[[1]]$root.edge + 
  #                ape::node.depth.edgelength(OutbreakTools::get.trees(sim2)[[1]]))
})