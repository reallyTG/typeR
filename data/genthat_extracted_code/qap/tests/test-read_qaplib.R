library("testthat")
library("qap")

# can we read all the QAPLIP files?
problems <- dir(system.file("qaplib", package="qap"), pattern = "*.dat")

for(p in problems) {
  cat("Reading problem", p ,"\n")
  expect_silent(read_qaplib(system.file("qaplib", p, package="qap")))
}
