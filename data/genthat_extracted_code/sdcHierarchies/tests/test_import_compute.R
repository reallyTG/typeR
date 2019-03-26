context("Importing and modifying hierarchies")

# non-unique leaves detected
expect_error(
  hier_create(
    root = "top",
    nodes = c("top")
  )
)

dim1 <- hier_create(
  root = "Total",
  nodes = NULL
)

dim2 <- hier_create(
  root = "top",
  nodes = letters[1:4]
)

expect_equal(.is_valid(dim1), TRUE)
expect_equal(.is_valid(dim2), TRUE)
expect_identical(.rootnode(dim1), "Total")
expect_identical(.rootnode(dim2), "top")

expect_error(
  hier_rename(
    tree = dim1,
    nodes = c("Totalx" = "new_code")
  )
)

dim1 <- hier_rename(
  tree = dim1,
  nodes = c("Total" = "tot")
)

expect_identical(.rootnode(dim1), "tot")

# new name already exists
expect_error(
  hier_rename(
    tree = dim2,
    nodes = c("a" = "b")
  )
)

# duplicated values
expect_error(
  hier_rename(
    tree = dim2,
    nodes = c("Totalx" = "new_code", "Total" = "new_code")
  )
)

dim2 <- hier_rename(
  tree = dim2,
  nodes = c("a" = "A", "c" = "C")
)

expect_error(
  hier_add(
    tree = dim2,
    root = "X",
    nodes = c("a1", "a2")
  ),
  "The root node does not exist!"
)

expect_warning(
  dim2 <- hier_add(
    tree = dim2,
    root = "A",
    nodes = "A"
  )
)

expect_warning(
  dim2 <- hier_add(
    tree = dim2,
    root = "top",
    nodes = "A"
  )
)

dim2 <- hier_add(
  tree = dim2,
  root = "A",
  nodes = c("a1", "a2")
)

expect_error(
  dim2 <- hier_rename(
    tree = dim2,
    nodes = c("C" = "A")
  )
)

df <- hier_convert(dim2, as = "df")
expect_is(df, "data.frame")

exp_names <- c("top", "A", "a1", "a2", "C", "b", "d")
exp_levs <- c("@", "@@", rep("@@@", 2), rep("@@", 3))
expect_identical(df$name, exp_names)
expect_identical(df$level, exp_levs)

dt <- hier_convert(dim2, as = "dt")
expect_is(dt, "data.table")

sdc <- hier_convert(dim2, as = "sdc")
expect_is(sdc, "list")
expect_is(sdc$codes, "list")
expect_identical(sdc$codes$orig, exp_names)
expect_equal(sdc$codes$level, nchar(exp_levs))

info <- hier_info(dim2)

# not all leaves exist in the tree
expect_error(
  hier_info(
    tree = dim2,
    nodes = c("a", "a1")
  )
)

expect_is(info, "list")
expect_equal(
  as.character(sapply(info, function(x) {
    x$name
  })),
  .all_nodes(dim2)
)

# we can't delete the rootnode
expect_error(
  hier_delete(tree = dim2, nodes = "top")
)

expect_warning(dim2 <- hier_delete(tree = dim2, nodes = "X"))

dim2 <- hier_delete(tree = dim2, nodes = c("a1", "d"))
df <- hier_convert(dim2, as = "df")

exp_names <- c("top", "A", "a2", "C", "b")
exp_levs <- c("@", "@@", "@@@", rep("@@", 2))
expect_identical(df$name, exp_names)
expect_identical(df$level, exp_levs)

info <- hier_info(dim2)

expect_identical(info[["a2"]]$is_bogus, TRUE)

expect_error(hier_nodenames(dim2, "X"))
expect_equal(hier_nodenames(dim2, "A"), c("A", "a2"))

context("Importing from list-input")
ll <- list()
ll[[1]] <- c("1.", "2.", "3.")
ll[["1."]] <- paste0("1.", 1:9, ".")
ll[["1.1."]] <- paste0("1.1.", 1:2, ".")
ll[["1.2."]] <- paste0("1.2.", 1:5, ".")
ll[["1.3."]] <- paste0("1.3.", 1:5, ".")
ll[["1.4."]] <- paste0("1.4.", 1:6, ".")

expect_error(
  d <- hier_compute(
    inp = ll,
    root = "Total",
    method = "list",
    as = "network"
  )
)

names(ll)[1] <- "Total"
d <- hier_compute(
  inp = ll,
  root = "Total",
  method = "list",
  as = "network"
)

expect_true(.is_valid(d))
expect_identical(.rootnode(d), "Total")

context("test hrc-files")
expect_error(
  hier_import(
    inp = "asdf",
    from = "hrc",
    root = "Total"
  )
)

d_hrc <- hier_import(
  inp = "hrc/hrc1.hrc",
  from = "hrc"
)
df_hrc <- hier_convert(d_hrc, as = "df")
expect_equal(nrow(df_hrc), 27)
expect_equal(df_hrc$name[1], "Total")
expect_equal(df_hrc$name[27], "FI200")

d_hrc <- hier_import(
  inp = "hrc/hrc2.hrc",
  from = "hrc",
  root = "TT"
)
df_hrc <- hier_convert(d_hrc, as = "df")
expect_equal(nrow(df_hrc), 30)
expect_equal(df_hrc$name[1], "TT")
expect_equal(df_hrc$name[30], "3.")

context("test other imports")
# test imports
out_json <- hier_convert(d, as = "json")
out_argus <- hier_convert(d, as = "argus")
out_code <- hier_convert(d, as = "code")
out_sdc <- hier_convert(d, as = "sdc")

d_from_json1 <- hier_import(inp = out_json, from = "json", root = "Total")
d_from_json2 <- hier_import(inp = out_json, from = "json")
d_from_code <- hier_import(inp = out_code, from = "code")
d_from_sdc <- hier_import(inp = out_sdc, from = "sdc")
d_from_argus <- hier_import(inp = out_argus, from = "argus")

expect_equal(d_from_json1, d_from_json2)
expect_equal(d_from_json2, d_from_code)
expect_equal(d_from_code, d_from_sdc)
expect_equal(d_from_sdc, d_from_argus)

out_df <- hier_export(tree = d, as = "df", path = tempfile())
d_df <- hier_import(inp = out_df, from = "df")
expect_is(out_df, "data.frame")

out_json <- hier_export(tree = d, as = "json", path = tempfile())
d_json <- hier_import(out_json, from = "json")
expect_equal(attr(out_json, "hier_format"), "json")
expect_equal(attr(out_json, "hier_convert"), TRUE)

out_argus <- hier_export(tree = d, as = "argus", path = tempfile())
d_argus <- hier_import(out_argus, from = "argus")
expect_equal(attr(out_argus, "hier_format"), "argus")
expect_equal(attr(out_argus, "hier_convert"), TRUE)

out_code <- hier_export(tree = d, as = "code", path = tempfile())
d_code <- hier_import(out_code, from = "code")
expect_equal(attr(out_code, "hier_format"), "code")
expect_equal(attr(out_code, "hier_convert"), TRUE)

out_sdc <- hier_export(tree = d, as = "sdc", path = tempfile())
d_sdc <- hier_import(out_sdc, from = "sdc")
expect_equal(attr(out_sdc, "hier_format"), "sdc")
expect_equal(attr(out_sdc, "hier_convert"), TRUE)

expect_equal(d_df, d_json)
expect_equal(d_json, d_argus)
expect_equal(d_argus, d_code)
expect_equal(d_code, d_sdc)
