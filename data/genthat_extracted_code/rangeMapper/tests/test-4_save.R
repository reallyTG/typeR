context("4: Save")

breding_ranges = rgdal::readOGR(system.file(package = "rangeMapper",
     "extdata", "wrens", "vector_combined"), "wrens", verbose = FALSE)[1:10, ]
data(wrens)
d = subset(wrens, select = c('sci_name', 'body_size', 'body_mass', 'clutch_size') )
con = ramp("wrens.sqlite", gridSize = 10, spdf = breding_ranges, biotab = d, ID = "sci_name",
            metadata = rangeTraits(), FUN = "median", overwrite = TRUE)

test_that("rangeMap.save subsetting", {

  expect_true(
    rangeMap.save(con, biotab = "biotab", biotrait = "body_mass",
    tableName = "x", FUN = "avg",
    list(MAP_species_richness = "species_richness >= 5",
        BIO_biotab = "body_size > 15"
        ), overwrite = TRUE) )

  })

# test_that("rangeMap.save works in parallel", {
# 
#   cl<- parallel::makeCluster(parallel::detectCores())
# 
#   # Non parallel for SQL function
#   rangeMap.save(con, biotab = "biotab", biotrait = "body_mass", cl = cl,
#   tableName = "x", FUN = "avg", overwrite = TRUE)
# 
#   slowMean<- function(x, ...){
#   Sys.sleep(1)
#   mean(x, ...)
#   }
# 
#   parTime<- system.time(rangeMap.save(con, biotab = "biotab", biotrait = "body_mass", cl = cl,
#   tableName = "x", FUN = slowMean, na.rm = TRUE, overwrite = TRUE))
#   Time<- system.time(rangeMap.save(con, biotab = "biotab", biotrait = "body_mass",
#   tableName = "x", FUN = slowMean, na.rm = TRUE, overwrite = TRUE))
# 
#   parallel::stopCluster(cl)
# 
#   diffT<- parTime - Time
#   expect_lt(diffT["elapsed"], 0)
#   })
