library('testthat')

context("parse_gcode")
gcode_file_path = "extdata/raw_gcode.NC"
gcode_parsed = parse_gcode(system.file(gcode_file_path, package = "mtconnectR"))
gcode_parsed = gcode_parsed[1:50,]
data("example_gcode_parsed")
expect_equal(gcode_parsed,example_gcode_parsed)
