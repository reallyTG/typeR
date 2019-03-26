context("High-level test of rsed")

cat("Here's a line\n",
    "Here's a line we'll delete\n",
    "Line after which we'll insert a string\n",
    "Filler line\n",
    "A line after which we'll insert another string\n",
    "A line where we'll make a substitution\n",
    "A line where we'll delete 'this'\n",
    "A line we'll delete\n",
    "A line we'll entirely replace\n",
    "The last line\n",
    sep = "", file = "tmpTest_streamEdit.txt")

# Read the file into a 'stream'
stream <- readLines("tmpTest_streamEdit.txt")

# Insert a string using line numbers
stream <- sed_insert(stream, after = 3, "Here's the first insertion")

# Insert a stream by searching
stream <- sed_insert(stream,
                     c("Here's the second insertion",
                       "Another line of the second insertion"),
                       after = "insert another")

# Here's a deletion of lines 1 and 2 using line numbers
stream <- sed_replace(stream, 1:2, NULL)

# Here's a line deletion using a search string
stream <- sed_replace(stream, "A line we'll delete", NULL)

# Here's a line replacement
stream <- sed_replace(stream, "entirely", "A replacement for the line")

# Here's a deletion within the line
stream <- sed_substitute(stream, " 'this'", "")

# Here's a substitution of text
stream <- sed_substitute(stream, "substitution", "correction")

# And commenting the last line
stream <- sed_comment(stream, "last", type = "html")

# Uncommenting it
stream <- sed_comment(stream, "last", add = FALSE, type = "html")

# Custom commenting on the last line
stream <- sed_comment(stream, "last", type = c("&& ", " *;"))

################################################################################
# Now let's apply the same changes all at once using streamEdit()
################################################################################

stream1 <- streamEdit(list(i = list(after = 3, insertion = "Here's the first insertion"),
                           i = list(after = "insert another",
                                    insertion = c("Here's the second insertion",
                                                  "Another line of the second insertion")),
                           r = list(at = 1:2, replacement = NULL),
                           r = list(at = "A line we'll delete", replacement = NULL),
                           r = list(at = "entirely", replacement = "A replacement for the line"),
                           s = list(pattern = " 'this'", replacement = ""),
                           s = list(pattern = "substitution", replacement = "correction"),
                           c = list(at = "last", type = "html"),
                           c = list(at = "last", add = FALSE, type = "html"),
                           c = list(at = "last", type = c("&& ", " *;"))),
                       inFile = "tmpTest_streamEdit.txt")

unlink("tmpTest_streamEdit.txt")

# Save the output file for future validation
# stream1_validate <- stream1
# save(stream1_validate, file = "~/github/rsed/tests/testthat/validationData/stream1_validate.Rdata")

test_that("manual edits are the same as streamEdit()", {

  expect_equal(stream, stream1)

})

test_that("historical results compare to current", {

  load("validationData/stream1_validate.Rdata")
  expect_equal(stream1, stream1_validate)
  
})
