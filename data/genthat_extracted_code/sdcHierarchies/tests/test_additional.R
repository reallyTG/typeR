context("Additional tests")

tree <- hier_create(root = "Tot", nodes = letters[1:5])

# test for hier_nodenames
expect_identical(
  hier_nodenames(tree, root = NULL),
  c("Tot", letters[1:5])
)

tree <- hier_add(
  tree = tree,
  root = "b",
  nodes = c("b1", "b2")
)

expect_true(.is_valid_leaf(tree = tree, leaf = "a"))
expect_error(.is_valid_leaf(tree = tree, leaf = "a1"))

# print/display method
expect_is(
  hier_display(tree), "tree"
)

# print, but start from a subnode
expect_is(
  hier_display(tree, root = "b"), "tree"
)

# export
tf <- tempfile()

x <- hier_export(tree, as = "df", path = tf, verbose = TRUE)
expect_is(x, "data.frame")
expect_equal(attr(x, "hier_format"), "df")
expect_equal(attr(x, "hier_convert"), TRUE)

# file already exists
expect_error(
  hier_export(tree, as = "df", path = tf)
)

# tempdir; no permissions
# file could not be created
td <- tempdir()
system(paste("chmod 600", td))
expect_error(
  hier_export(tree, as = "df", path = tf, verbose = TRUE)
)
system(paste("chmod 755", td))

# hier_compute
ll <- list()
ll[["Tot"]] <- letters[1:3]
ll[["a"]] <- paste0("a", 1:5)
ll[["a5"]] <- "a5a"
tree <- hier_compute(
  inp = ll,
  root = "Tot",
  method = "list",
  as = "df"
)
expect_is(tree, "data.frame")
expect_true(attr(tree, "hier_convert"))
expect_identical(attr(tree, "hier_format"), "df")

tree <- hier_compute(
  inp = ll,
  root = "Tot",
  method = "list",
  as = "network"
)
hier_convert(tree, as = "code")

# convert from dt with bogus codes
sdc <- hier_convert(tree, as = "sdc")
tree <- hier_import(inp = sdc, from = "sdc")
expect_equal(.bogus_codes(tree), "a5a")

erg_sdc <- hier_convert(tree, as = "sdc")
expect_equal(erg_sdc$bogus$bogus_codes, "a5a")
expect_equal(erg_sdc$bogus$bogus_parents, "a5")

# tests with rootnode only tree
tree <- hier_create(root = "Total")
erg_sdc <- hier_convert(tree, as = "sdc")
expect_identical(erg_sdc$codes$orig, "Total")
expect_identical(erg_sdc$codes$default, "0")
expect_true(erg_sdc$codes$minimal)
expect_identical(length(erg_sdc$dims), 0L)
expect_null(erg_sdc$bogus$bogus_codes)
expect_null(erg_sdc$bogus$bogus_parents)

erg_code <- hier_convert(tree, as = "code")
expect_is(hier_display(erg_code), "tree")

expect_is(erg_code, "character")
expect_identical(length(erg_code), 3L)
expect_identical(length(erg_code), 3L)
expect_true(attr(erg_code, "hier_convert"))
expect_identical(attr(erg_code, "hier_format"), "code")

erg_json <- hier_convert(tree, as = "json")
expect_equivalent(erg_json, "[]")
expect_true(attr(erg_json, "hier_convert"))
expect_identical(attr(erg_json, "hier_format"), "json")

# non-existing root attribute in json (perhaps shiny?)
attr(erg_json, "totlev") <- ""
expect_identical(
  hier_import(erg_json, from = "json")$root,
  "rootnode"
)

# compute siblings of a non-existing node
expect_error(.siblings(tree, "x"))

# compute names of minimal codes
expect_equal(.minimal_codes(tree), "Total")

# prune a tree by specifying a non-existing level
# returns the tree
tree2 <- .prune(tree, "x")
expect_identical(tree, tree2)

# imports
rr <- hier_import(erg_json, root = "x")
expect_identical(rr$root, rr$leaf)
expect_identical(rr$root, "x")

dt <- hier_convert(rr, as = "dt")
rr <- hier_import(dt, from = "dt")
expect_identical(rr$root, rr$leaf)
expect_identical(rr$root, "x")

## compute
ll <- list()
ll[["Total"]] <- letters[1:2]
ll[["a"]] <- paste0("a", 1:5)
ll[["b"]] <- paste0("b", 1:5)
names(ll) <- c("Total", "a", "a")
# duplicated list-names found
expect_error(
  hier_compute(inp = ll, method = "list", root = "Total")
)

# non-valid dim_spec specification
v <- c("01", "02")
expect_error(
  hier_compute(
    inp = v,
    method = "len",
    root = NULL,
    dim_spec = NULL
  )
)
expect_error(
  hier_compute(
    inp = v,
    method = "endpos",
    root = NULL,
    dim_spec = c("1", "1")
  )
)

## duplicated values in input
v <- c("01", "02", "02")
expect_error(
  hier_compute(
    inp = v,
    method = "len",
    root = NULL,
    dim_spec = c(1, 1)
  )
)

# only_total
tree <- hier_compute(
  inp = "Tot",
  method = "len",
  root = NULL,
  dim_spec = c(3)
)
expect_identical(tree$root, "Tot")
expect_identical(tree$leaf, "Tot")
expect_is(tree, "sdc_hierarchy")
