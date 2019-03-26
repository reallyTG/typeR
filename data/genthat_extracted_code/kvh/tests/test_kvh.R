context("examples")
dexample=system.file("examples", package="kvh")
fexample=system(sprintf("ls -1 %s/*.kvh", dexample), intern=TRUE)
saved=readRDS("res.RData")
res=list()
test_that("example files",
  for (f in fexample) {
    bf=basename(f)
    res[[bf]]=kvh_read(f)
    expect_equal(res[[bf]], saved[[bf]], info=f)
  }
)
test_that("obj_by_keys", {
  expect_equal(kvh::obj_by_keys(res[["hello_salut.kvh"]], c("salutation", "en")), "Hello, world!")
  expect_null(kvh::obj_by_keys(res[["hello_salut.kvh"]], c("salutation", "zz")))
}
)

# create test files
wd=tempdir(TRUE)
fn=tempfile(pattern = "file", tmpdir = wd, fileext = ".kvh")
fc=file(fn, "wb")
cat(" a \t b \n", file=fc)
close(fc)
res=kvh::kvh_read(fn, strip_white=TRUE)
test_that("strip_white",
  expect_equal(res[["a"]], "b", info="strip spaces")
)
fc=file(fn, "wb")
cat("a\tb\n\n\t\t \r\nc\td\n", file=fc)
close(fc)
res=kvh::kvh_read(fn, skip_blank=TRUE)
test_that("skip_blank", {
  expect_equal(res[["a"]], "b", info="before skip blank")
  expect_equal(res[["c"]], "d", info="after skip blank")
  expect_equal(length(res), 2, info="total skip blank")
}
)

# test commnets, stripping white and skipping blank
fc=file(fn, "wb")
cat("a\tb # comment\n\t# comment on a blank line\nc\td", file=fc)
close(fc)
res=kvh::kvh_read(fn, comment_str="#", strip_white=TRUE, skip_blank=TRUE)
test_that("comment strip & skip_blank", {
  expect_equal(res[["a"]], "b", info="before comment strip & skip blank")
  expect_equal(res[["c"]], "d", info="after comment strip & skip blank")
  expect_equal(length(res), 2, info="total comment strip & skip blank")
}
)

# test spliting value string by tabs
fc=file(fn, "wb")
cat("a\tb1\tb2\\\tb2_too\tb3\n", file=fc)
close(fc)
res=kvh::kvh_read(fn, split_str="\t")
test_that("split value", {
  expect_equal(res[["a"]], c("b1", "b2\tb2_too", "b3"))
}
)

# test follow_url and strip_white
fn2=tempfile(pattern = "file", tmpdir = wd, fileext = ".kvh")
fc=file(fn, "wb")
cat("a\t file://", fn2, " \n", sep="", file=fc)
close(fc)
fc=file(fn2, "wb")
cat("k\tv\nbad nested ref\t file://", fn, " \n", sep="", file=fc)
close(fc)
res=kvh::kvh_read(fn, strip_white=TRUE, follow_url=TRUE)
test_that("split value", {
  expect_equal(res[["a"]], list(k="v", `bad nested ref`=paste0("file://", fn)), check.attributes=FALSE)
  expect_warning(kvh::kvh_read(fn, strip_white=TRUE, follow_url=TRUE), "kvh_read: detected nested reference to file ")
}
)
unlink(fn)
