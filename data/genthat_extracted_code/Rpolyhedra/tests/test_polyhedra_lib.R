

context("polyhedra- Check package db")
testthat::test_that("Check pkg-minimal size and objects", {
  available.polyhedra <- getAvailablePolyhedra()
  testthat::expect_equal(
    nrow(available.polyhedra[available.polyhedra$source == "netlib", ]),
    119)
  testthat::expect_equal(
    nrow(available.polyhedra[available.polyhedra$source == "dmccooey", ]),
    9)
  .polyhedra <- getPolyhedraObject()
  sources.netlib.dir <- .polyhedra$getPolyhedraSourceDir(source = "netlib")
  polyhedra.rds.netlib <- dir(sources.netlib.dir)
  polyhedra.rds.netlib <- polyhedra.rds.netlib[
              grep("\\.RDS\\.zip", polyhedra.rds.netlib)]
  testthat::expect_equal(length(polyhedra.rds.netlib), 119)

  sources.dmccooey.dir <- .polyhedra$getPolyhedraSourceDir(source = "dmccooey")
  polyhedra.rds.dmccooey <- dir(sources.dmccooey.dir)
  polyhedra.rds.dmccooey <- polyhedra.rds.dmccooey[
                grep("\\.RDS\\.zip", polyhedra.rds.dmccooey)]
  testthat::expect_equal(length(polyhedra.rds.dmccooey), 9)
})


context("polyhedra- Regular solids")
testthat::test_that("Scrape test rpolyhedra 5 regular solids", {
  tasks <- getPolyhedraObject()$generateTestTasks(sources = "netlib",
      polyhedra.names = c("tetrahedron",
                          "octahedron",
                          "cube",
                          "dodecahedron",
                          "icosahedron"),
      TestTaskClass = PolyhedronTestTaskScrape.class,
                          max.quant = 5)
  for (task in tasks){
    task$run()
  }
})

context("polyhedra- Scrape available polyhedra")
testthat::test_that("Scrape test rpolyhedra for 12% of available polyhedra", {
  tasks <- getPolyhedraObject()$
    generateTestTasks(TestTaskClass = PolyhedronTestTaskScrape.class,
    max.quant = getPercentilPolyhedraQuant(0.12, 50))
  for (task in tasks){
    task$run()
  }
})

context("polyhedra- Properties regular solids")
testthat::test_that("test getting properties of scraped regular solids", {
  tetrahedron <- getPolyhedron(source = "netlib",
                               polyhedron.name = "tetrahedron")
  tetrahedron$checkProperties(expected.vertices = 4,
                              expected.faces = 4)

  octahedron <- getPolyhedron(source = "netlib",
                              polyhedron.name = "octahedron")
  octahedron$checkProperties(expected.vertices = 6,
                             expected.faces = 8)
  cube <- getPolyhedron(source = "netlib",
                        polyhedron.name = "cube")
  cube$checkProperties(expected.vertices = 8,
                       expected.faces = 6)

  icosahedron <- getPolyhedron(source = "netlib",
                               polyhedron.name = "icosahedron")
  icosahedron$checkProperties(expected.vertices = 12,
                              expected.faces = 20)
  dodecahedron <- getPolyhedron(source = "netlib",
                                polyhedron.name = "dodecahedron")
  dodecahedron$checkProperties(expected.vertices = 20,
                               expected.faces = 12)
})


context("polyhedra- Edges Consistency")
testthat::test_that(paste("test check edges consistency for 12% of",
            "available polyhedra"), {
  tasks <- getPolyhedraObject()$
    generateTestTasks(TestTaskClass = PolyhedronTestTaskEdgesConsistency.class,
                    max.quant = getPercentilPolyhedraQuant(0.12, 50))

  for (task in tasks){
    task$run()
  }
})

context("polyhedra- RGL")
testthat::test_that("Build RGL model for polyhedra", {
    hexagonal.prism <- getPolyhedron("netlib", "hexagonal prism")
    rgl <- hexagonal.prism$getState()$buildRGL()
    testthat::expect_equal(dim(rgl$vb), c(4, 36))
  })
