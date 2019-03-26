## ----eval = FALSE--------------------------------------------------------
#  pdf <- getOption("pdfviewer", default = "")
#  f <- system.file("pdf", "Mannings_n_Values.pdf", package = "iemiscdata")
#  system2(pdf, args = f)

## ----eval = FALSE--------------------------------------------------------
#  f <- system.file("pdf", "Mannings_n_Values.pdf", package = "iemiscdata")
#  shell.exec(normalizePath(f))

## ----eval = FALSE--------------------------------------------------------
#  f <- system.file("pdf", "Mannings_n_Values.pdf", package = "iemiscdata")
#  system2("open", args = f, wait = FALSE)

