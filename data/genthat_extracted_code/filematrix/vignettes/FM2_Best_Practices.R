## ----setup, echo=FALSE---------------------------------------------------
library(knitr)
# opts_knit$set(root.dir=tempdir())

## ----message=FALSE-------------------------------------------------------
library(filematrix)
fm = fm.create(
        filenamebase = tempfile(),
        nrow = 5000,
        ncol = 10000,
        type = "double")

## ------------------------------------------------------------------------
step1 = 512
runto = ncol(fm)
nsteps = ceiling(runto/step1)
for( part in seq_len(nsteps) ) { # part = 1
    fr = (part-1)*step1 + 1
    to = min(part*step1, runto)
    message( "Filling in columns ", fr, " to ", to)
    fm[,fr:to] = runif(nrow(fm) * (to-fr+1))
}
rm(part, step1, runto, nsteps, fr, to)

## ------------------------------------------------------------------------
fmcolsums = double(ncol(fm))

step1 = 512
runto = ncol(fm)
nsteps = ceiling(runto/step1)
for( part in seq_len(nsteps) ) { # part = 1
    fr = (part-1)*step1 + 1
    to = min(part*step1, runto)
    message("Calculating column sums, processing columns ", fr, " to ", to)
    fmcolsums[fr:to] = colSums(fm[,fr:to])
}
rm(part, step1, runto, nsteps, fr, to)

message("Sums of first and last columns are ", 
        fmcolsums[1], " and ", tail(fmcolsums,1))

## ------------------------------------------------------------------------
fmrowsums = double(nrow(fm))

step1 = 512
runto = ncol(fm)
nsteps = ceiling(runto/step1)
for( part in seq_len(nsteps) ) { # part = 1
    fr = (part-1)*step1 + 1
    to = min(part*step1, runto)
    message("Calculating row sums, processing columns ", fr, " to ", to)
    fmrowsums = fmrowsums + rowSums(fm[,fr:to])
}
rm(part, step1, runto, nsteps, fr, to)

message("Sums of first and last rows are ", 
        fmrowsums[1], " and ", tail(fmrowsums,1))

## ------------------------------------------------------------------------
closeAndDeleteFiles(fm)

## ----version-------------------------------------------------------------
sessionInfo()

