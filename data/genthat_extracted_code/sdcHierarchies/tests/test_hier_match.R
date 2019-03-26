context("hier_match()")

h <- hier_create(root = "Tot", nodes = letters[1:5])
h <- hier_add(h, root = "a", nodes = "a0")


mm <- hier_match(tree = h, nodes = NULL, inputs = "orig")

expect_is(mm, "data.table")
expect_identical(nrow(mm), 7L)
expect_identical(ncol(mm), 3L)
expect_identical(names(mm), c("orig", "default", "is_bogus"))
expect_identical(mm$orig, c("Tot", letters[1:5], "a0"))
expect_identical(mm$default[nrow(mm)], NA_character_)
expect_true(mm$is_bogus[nrow(mm)])

# check errors
# wrong input for nodes
expect_error(
  hier_match(tree = h, nodes = 5, inputs = "orig")
)
# wrong input for inputs
expect_error(
  hier_match(tree = h, nodes = NULL, inputs = "wrong")
)
expect_error(
  hier_match(tree = h, nodes = NULL, inputs = c("wrong1", "wrong2"))
)
# missing codes
expect_error(
  hier_match(tree = h, nodes = "ax", inputs = "default")
)
expect_error(
  hier_match(tree = h, nodes = "ax", inputs = "orig")
)

h2 <- hier_convert(tree = h, as = "dt")
hier_match(tree = h, nodes = c("a", "b"), inputs = "orig")
hier_match(tree = h2, nodes = c("01", "02"), inputs = "default")
