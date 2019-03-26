context("issue #8")

tree <- hier_create(root = "Total", nodes = LETTERS[1:4])
tree <- hier_add(tree, root = "A", nodes = "a0")

code <- hier_convert(tree, as = "code")

tree_imported <- hier_import(inp = code, from = "code")

tree <- .sort(tree)
tree_imported <- .sort(tree_imported)

expect_true(inherits(tree_imported, "sdc_hierarchy"))
expect_identical(tree_imported, tree)
