context("extract")

test_that("extract function works", {

    expect_error(extract())
    expect_error(extract(extract_vector = "derp"))
    expect_error(extract(extract_matrix = "derp"))
    expect_error(extract(extract_vector = "derp", extract_matrix = "derp"))
    expect_error(extract(extract_vector = function() {}, extract_matrix = "derp"))
    expect_error(extract(extract_vector = "derp", extract_matrix = function() {}))
    expect_error(extract(extract_vector = function() {}, extract_matrix = function() {}))
    expect_error(extract(extract_vector = function(x) {}, extract_matrix = function(x) {}))
    expect_error(extract(extract_vector = function(x, i) {}, extract_matrix = function(x, i) {}))

    expect_type(extract(extract_vector = function(x, i) {}, extract_matrix = function(x, i, j) {}), "closure")

})


context("replace")

test_that("replace function works", {

    expect_error(replace())
    expect_error(replace(replace_vector = "derp"))
    expect_error(replace(replace_matrix = "derp"))
    expect_error(replace(replace_vector = "derp", replace_matrix = "derp"))
    expect_error(replace(replace_vector = function() {}, replace_matrix = "derp"))
    expect_error(replace(replace_vector = "derp", replace_matrix = function() {}))
    expect_error(replace(replace_vector = function() {}, replace_matrix = function() {}))
    expect_error(replace(replace_vector = function(x) {}, replace_matrix = function(x) {}))
    expect_error(replace(replace_vector = function(x, i) {}, replace_matrix = function(x, i) {}))
    expect_error(replace(replace_vector = function(x, i, j) {}, replace_matrix = function(x, i, j) {}))

    expect_type(replace(replace_vector = function(x, i, j, value) {}, replace_matrix = function(x, i, j, value) {}), "closure")
    expect_type(replace(replace_vector = function(x, i, j, ..., value) {}, replace_matrix = function(x, i, j, ..., value) {}), "closure")

})
