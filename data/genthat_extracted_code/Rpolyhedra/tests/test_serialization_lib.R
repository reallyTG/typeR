context("serialization-lib XML export")
testthat::test_that("test xml can be exported", {
  xml.polyhedron <- polyhedronToXML(
          getPolyhedron("netlib", "tetrahedron")$getState())
  testthat::expect_equal(
    as.numeric(nchar(XML::getChildrenStrings(xml.polyhedron))), 406)
})
