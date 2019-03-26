context("hier_to_tree()")

tree <- hier_create(root = "Total", nodes = LETTERS[1:4])
tree <- hier_add(tree, root = "A", nodes = "a0")

d1 <- hier_convert(tree, as = "df")
d2 <- hier_convert(tree, as = "dt")
d3 <- hier_convert(tree, as = "argus")
d4 <- hier_convert(tree, as = "json")
d5 <- hier_convert(tree, as = "code")
d6 <- hier_convert(tree, as = "sdc")

# invalid input
expect_error(hier_to_tree(inp = 5))
expect_identical(hier_to_tree(.sort(tree)), hier_to_tree(d1))
expect_identical(hier_to_tree(d1), hier_to_tree(d2))
expect_identical(hier_to_tree(d2), hier_to_tree(d3))
expect_identical(hier_to_tree(d3), hier_to_tree(d4))
expect_identical(hier_to_tree(d5), hier_to_tree(d6))
