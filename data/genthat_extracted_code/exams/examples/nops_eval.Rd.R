library(exams)


### Name: nops_eval
### Title: Evaluate NOPS Exams
### Aliases: nops_eval
### Keywords: utilities

### ** Examples

## --- Preliminaries ---

## load package and enforce par(ask = FALSE)
library("exams")
options(device.ask.default = FALSE)

## set up a temporary working directory in which all files are managed
odir <- getwd()
dir.create(mydir <- tempfile())
setwd(mydir)


## --- Step 1 ---
## exam generation

## define an exam (= list of exercises)
myexam <- list(
  "tstat2.Rnw",
  "ttest.Rnw",
  "relfreq.Rnw",
  "anova.Rnw",
  c("boxplots.Rnw", "scatterplot.Rnw"),
  "cholesky.Rnw"
)

## create multiple exams on the disk with different numbers of points
## per exercise (see ?exams2nops for more examples)
set.seed(403)
ex1 <- exams2nops(myexam, n = 2, dir = ".", date = "2015-07-29",
  points = c(1, 1, 1, 2, 2, 3), showpoints = TRUE)
dir()

## assume the PDF exams were already printed (and possibly backed up
## in a different directory) so that they are not needed anymore
file.remove(dir(pattern = "pdf$"))


## --- Step 2 ---
## scan results

## assume two participants filled out the printed exam sheets
## and the corresponding scans are in two PNG files,
img <- dir(system.file("nops", package = "exams"), pattern = "nops_scan",
  full.names = TRUE)

## copy the PNG files to the working directory
file.copy(img, to = ".")

## read the scanned images (all locally available .png files) and collect
## results in a ZIP archive (see ?nops_scan for more details)
nops_scan()
dir()

## the ZIP archive contains copies of the PNG images so that these are
## can be deleted here (possibly after backup in a different directory)
file.remove(dir(pattern = "png$"))


## -- Step 3 ---
## evaluate results

## three files are required: (a) an RDS file with the exam meta-information
## (see Step 1), (b) a ZIP file with the scanned sheets (see Step 2), (c) a
## CSV file with the student infomation (registration number, name, and some
## for of ID/username)

## here we create the CSV file on the fly but in practice this will typically
## be processed from some registration service or learning management system etc
write.table(data.frame(
  registration = c("1501090", "9901071"),
  name = c("Jane Doe", "Ambi Dexter"),
  id = c("jane_doe", "ambi_dexter")
), file = "Exam-2015-07-29.csv", sep = ";", quote = FALSE, row.names = FALSE)
dir()
## now the exam can be evaluated creating an output data frame (also stored
## as CSV file) and individual HTML reports (stored in a ZIP file),

## as there is only exactly on CSV/RDS/ZIP file in the current directory,
## these are found automatically - furthermore an evaluation scheme without
## partial points and differing points per exercise are used
ev1 <- nops_eval(eval = exams_eval(partial = FALSE, negative = FALSE))
dir()

## inspect evaluated data
ev1

## inspect corresponding HTML reports
if(interactive()) {
unzip("nops_eval.zip")
browseURL(file.path(mydir, "jane_doe",    "Exam-2015-07-29.html"))
browseURL(file.path(mydir, "ambi_dexter", "Exam-2015-07-29.html"))
}


## --- Options ---
if(interactive()) {
## below three typically needed options are discussed:
## (a) using a different evaluation strategy (here with partial credits),
## (b) using a different language (here de/German),
## (c) an error of the participant when filling in the registration number.

## as for (a): partial credits should only be used for multiple-choice questions
## where at least one alternative is correct and at least one is false
## [note that in this example this is not the case for the first question
## (single-choice) and the third question for Jane Doe (no alternative correct)]

## as for (c): for Ambi Dexter such an error was included in the PNG example
## image, the actual number is "9911071" but the crosses indicate "9901071"

## clean up previous evaluation
file.remove(c("nops_eval.csv", "nops_eval.zip"))

## write correct registration information
write.table(data.frame(
  registration = c("1501090", "9911071"),
  name = c("Jane Doe", "Ambi Dexter"),
  id = c("jane_doe", "ambi_dexter")
), file = "Exam-2015-07-29.csv", sep = ";", quote = FALSE, row.names = FALSE)

## call nops_eval() with modified options, where the error in the registration
## number of Ambi Dexter will trigger an interactive prompt
ev2 <- nops_eval(eval = exams_eval(partial = TRUE, rule = "false2"),
  language = "de")

## inspect evaluated data
ev2
cbind(ev1$points, ev2$points)

## inspect corresponding HTML reports
unzip("nops_eval.zip")
browseURL(file.path(mydir, "jane_doe",    "Exam-2015-07-29.html"))
browseURL(file.path(mydir, "ambi_dexter", "Exam-2015-07-29.html"))
}

## switch back to original working directory
setwd(odir)



