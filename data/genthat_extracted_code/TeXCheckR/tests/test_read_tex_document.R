context("read_tex_document")

test_that("Reads file with spaces before input", {
  tempd <- tempdir()
  tempf <- tempfile(fileext = ".tex", tmpdir = tempd)
  writeLines(c("\\documentclass{article}", 
               "\\input{A}",
               "\\begin{document}", 
               "b", 
               "\\include{C}", 
               "      \\input{D}   ", 
               "input\\input{E}F", 
               "\\end{document}"), 
             tempf)
  for (L in LETTERS) {
    switch(L, 
           A = writeLines(c("\\relax", "\\relax"), file.path(tempd, paste0(L, ".tex"))),
           writeLines(L, file.path(tempd, paste0(L, ".tex"))))
  }
  
  x <- read_tex_document(tempf)
  expect_equal(x, 
               c("\\documentclass{article}", 
                 "\\relax",
                 "\\relax",
                 "\\begin{document}", 
                 "b", 
                 "C", 
                 "      D   ", 
                 "inputEF", 
                 "\\end{document}"))
  
  
  
})