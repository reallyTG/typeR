### R code from vignette source 'scriptests.Rnw'

###################################################
### code chunk number 1: scriptests.Rnw:65-70
###################################################
options(scriptests.pkg.path.saved=getOption("scriptests.pkg.path"))
options(scriptests.pkg.path=NULL)
options(useFancyQuotes=FALSE)
Sys.setenv("R_NOUSERPROFILE"=1) # Inhibit personal .Rprofile
if (file.exists("testpkg")) unlink("testpkg", recursive=TRUE)


###################################################
### code chunk number 2: scriptests.Rnw:72-89
###################################################
# This block of R code creates a simple package containing 2 files
dir.create("testpkg")
cat(                                 file="testpkg/DESCRIPTION", '
Package: testpkg
Version: 1.0-0
License: GPL-3
Description: A simple example of using scriptests for unit tests
Title: Unit tests with scriptests
Author: Joe Blow <joeblo@foobar.org>
Maintainer: Joe Blow <joeblo@foobar.org>
Suggests: scriptests
')

dir.create("testpkg/R")
cat(                                 file="testpkg/R/plus.R", '
plus <- function(x, y) x + y
')


###################################################
### code chunk number 3: scriptests.Rnw:94-106
###################################################
# This block of R code adds 'runtests.R' and one test file to the package
dir.create("testpkg/tests")
cat(                                 file="testpkg/tests/runtests.R", '
library(scriptests)
runScripTests()
')

cat(                                 file="testpkg/tests/plus.Rt", '
> plus(3, 4)
[1] 7
>
')


###################################################
### code chunk number 4: scriptests.Rnw:121-125
###################################################
library(scriptests)
source.pkg(pkg="testpkg")
# use pattern= to only run test files that match the pattern
runtests(pkg="testpkg", pattern="plus")


###################################################
### code chunk number 5: scriptests.Rnw:131-145
###################################################
cat(                                 file="testpkg/tests/willfail.Rt", '
> plus(1, 1)
[1] 2
> plus(2, 2)
[1] 3
> plus(3, 3)
[1] 6
> ')
(res <- runtests(pkg="testpkg", pattern="fail"))
# Uh-oh, one of the tests failed!
# Look at the transcript of the tests
dumprout(res, console=TRUE)
# To write the transcript to a file, don't supply console=TRUE to dumprout()
dumprout(res)


###################################################
### code chunk number 6: scriptests.Rnw:148-149
###################################################
cat(paste("....   ", readLines("willfail.Rout.tmp")), sep="\n")


###################################################
### code chunk number 7: scriptests.Rnw:177-177
###################################################



###################################################
### code chunk number 8: scriptests.Rnw:185-198
###################################################
dir.create("testpkg/man")
cat(                                 file="testpkg/man/plus.Rd", '
\\name{plus}
\\alias{plus}
\\title{Add two numbers together}
\\description{Add two numbers together}
\\usage{plus(x, y)}
\\arguments{
  \\item{x}{A number}
  \\item{y}{A number}
}
\\value{A number}
')


###################################################
### code chunk number 9: scriptests.Rnw:202-203
###################################################
file.rename("testpkg/tests/willfail.Rt", "testpkg/tests/willfail.Rnorun")


###################################################
### code chunk number 10: scriptests.Rnw:212-215
###################################################
mysystem <- function(cmd) cat(system(cmd, intern=TRUE), sep="\n")
mysystem("R CMD build testpkg")
mysystem("R CMD check testpkg_1.0-0.tar.gz")


###################################################
### code chunk number 11: scriptests.Rnw:226-228
###################################################
cat(readLines("testpkg.Rcheck/tests/test-summary.txt"), sep="\n")
cat(readLines("testpkg.Rcheck/tests/plus.Rt.log"), sep="\n")


###################################################
### code chunk number 12: scriptests.Rnw:239-240
###################################################
file.rename("testpkg/tests/willfail.Rnorun", "testpkg/tests/willfail.Rt")


###################################################
### code chunk number 13: scriptests.Rnw:243-246
###################################################
mysystem <- function(cmd) cat(system(cmd, intern=TRUE), sep="\n")
mysystem("R CMD build testpkg")
mysystem("R CMD check testpkg_1.0-0.tar.gz")


###################################################
### code chunk number 14: scriptests.Rnw:265-268
###################################################
cat(readLines("testpkg.Rcheck/tests/test-summary.txt"), sep="\n")
cat(readLines("testpkg.Rcheck/tests/plus.Rt.log"), sep="\n")
cat(readLines("testpkg.Rcheck/tests/willfail.Rt.log"), sep="\n")


###################################################
### code chunk number 15: scriptests.Rnw:302-303
###################################################
runtests(full=TRUE)


###################################################
### code chunk number 16: scriptests.Rnw:436-437
###################################################
options(scriptests.pkg.path=getOption("scriptests.pkg.path.saved"))


