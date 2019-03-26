context("issue #7")
sdc <- hier_convert(
  tree = hier_create(root = "Total", nodes = LETTERS[1:4]),
  as = "sdc"
)

cc <- c("00", "01", "02", "03", "04")
labs <- c("Total", LETTERS[1:4])
expect_identical(sdc$codes$default, cc)
expect_identical(sdc$codes$orig, labs)
expect_identical(names(sdc$dims[[1]]), labs)
expect_identical(as.character(sdc$dims[[1]]), cc)
