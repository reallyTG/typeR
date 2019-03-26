context("1: Project ini")

spdf = rgdal::readOGR( system.file(package = "rangeMapper", "extdata", "wrens", "vector_combined"), "wrens", verbose = FALSE)

test_that("Building blocks are in place", {

	con  = rangeMap.start(file = "wrens.sqlite", dir = tempdir(), overwrite = TRUE)

	# basic elements
	name     = 'Campylorhynchus_gularis'
	spp      = spdf[spdf$sci_name == name, ]
	metadata = rangeTraits()
	ID       = "sci_name"
	ids      = spdf@data[, ID]
	p4s      =  dbReadTable(con, "proj4string")[1,1]

	# rangeMap class
	con = rangeMap.start(file = "wrens.sqlite", dir = tempdir(), overwrite = TRUE)
	rmo =  new("rangeMap", CON = con)
	expect_that(rmo, is_a('rangeMap') )

	#rangeMap fetch
	expect_error(new("rangeMapFetch", CON = con, tableName = "species_richness") )

	})

test_that("Bounding box methods work", {
	
	# 1. bbox and p4s are missing
	con = rangeMap.start(file = "wrens.sqlite", dir = tempdir(), overwrite = TRUE)
 	expect_warning(global.bbox.save(con = con))

	# 2. bbox path to file, p4s is missing
	con = rangeMap.start(file = "wrens.sqlite", dir = tempdir(), overwrite = TRUE)
 	expect_true(global.bbox.save(con = con, 
 		bbox = system.file(package = "rangeMapper", "extdata", "wrens", "vector") ) )

	# 3. bbox path to file, p4s is set
	con = rangeMap.start(file = "wrens.sqlite", dir = tempdir(), overwrite = TRUE)
 	expect_true(global.bbox.save(con = con, 
 		bbox = system.file(package = "rangeMapper", "extdata", "wrens", "vector"), 
 		p4s = CRS("+proj=aea") ) )

	# 5. bbox is a spatial object, p4s is missing
	con = rangeMap.start(file = "wrens.sqlite", dir = tempdir(), overwrite = TRUE)
 	expect_true(global.bbox.save(con = con, bbox = spdf ) )
	


	})

test_that("Pipeline works forward only", {

	# proj ini
	con = rangeMap.start(file = "wrens.sqlite", dir = tempdir(), overwrite = TRUE)
	expect_error(rangeMap.start(file = "wrens.sqlite", dir = tempdir(), overwrite = FALSE) )

	# bbox
	expect_error( global.bbox.fetch(con) )
	global.bbox.save(con = con, bbox = spdf)
	expect_error( global.bbox.save(con = con) )

	# grid size
	expect_error(gridSize.fetch(con))
	gridSize.save(con, gridSize = 10)
	expect_error( gridSize.save(con) )

	# canvas
	expect_error(canvas.fetch(con))
	canvas.save(con)
	expect_error( canvas.save(con) )
	expect_that(canvas.fetch(con) , is_a("SpatialPixelsDataFrame") )

	# process ranges
	processRanges(con = con, spdf = spdf, ID = "sci_name")
	expect_error(processRanges(con = con, spdf = spdf, ID = "sci_name") )

	# map
	expect_true( rangeMap.save(con) )
	expect_error( rangeMap.save(con) )

	# re-open
	con = rangeMap.open( paste(tempdir(), "wrens.sqlite", sep = .Platform$file.sep) )
	expect_that(con, is_a('SQLiteConnection'))

	})

test_that("Range overlay returns a data.frame", {
	con  = rangeMap.start(file = "wrens.sqlite", dir = tempdir(), overwrite = TRUE)
	spdf = rgdal::readOGR( system.file(package = "rangeMapper", "extdata", "wrens", "vector_combined"), "wrens", verbose = FALSE)

	global.bbox.save(con = con, bbox = spdf)
	gridSize.save(con, gridSize = 10)
	canvas.save(con)
	canvas = canvas.fetch(con)

	name = 'Campylorhynchus_gularis'
	spp  = spdf[spdf$sci_name == name, ]

	expect_that( rangeOverlay(spp, canvas, name) , is_a("data.frame") )

	})



