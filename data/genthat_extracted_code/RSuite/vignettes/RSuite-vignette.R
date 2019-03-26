## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#> "
)
knitr::opts_knit$set(root.dir = tempdir())

try(detach("package:mypackage", unload = TRUE), silent = TRUE)
unlink(file.path(tempdir(), "my_project"), recursive = TRUE, force = TRUE)

## ------------------------------------------------------------------------
RSuite::prj_start(name = 'my_project')

## ----include = FALSE-----------------------------------------------------
# it's a hack: knitr will restore current folder after chunk to the onet from opts_knit
knitr::opts_knit$set(root.dir = file.path(tempdir(), "my_project"))

## ------------------------------------------------------------------------
cat(list.files(".", all.files = TRUE), sep = "\n")

## ----comment = '', echo = FALSE------------------------------------------
cat(readLines(con = "R/master.R"), sep = "\n")

## ------------------------------------------------------------------------
source("R/master.R")
print("master.R sourced successfully.")

## ------------------------------------------------------------------------
RSuite::prj_start_package(name = "mypackage", skip_rc = TRUE)

## ----comment = '', echo = FALSE------------------------------------------
write("\nlibrary(mypackage)\n", file = "R/master.R", append = TRUE)

cat(readLines(con = "R/master.R"), sep = "\n")

## ----error = TRUE--------------------------------------------------------
source('R/master.R')

## ----error = TRUE--------------------------------------------------------
RSuite::prj_build()

## ----error = TRUE--------------------------------------------------------
source('R/master.R')
print("master.R sourced successfully and loaded mypackage.")

## ----comment = '', echo = FALSE------------------------------------------
writeLines(c("#' @export",
             "hello_world <- function(name) {",
             "    sprintf(\"Hello %s!\", name)",
             "}"),
           con = "packages/mypackage/R/hello_world.R")

cat(readLines("packages/mypackage/R/hello_world.R"), sep = "\n")

## ----comment = '', echo = FALSE------------------------------------------
write("hello_world(\"John\")\n", 
      file = "R/master.R", 
      append = TRUE)

cat(readLines("R/master.R"), sep = "\n")

## ----error = TRUE--------------------------------------------------------
source('R/master.R')

## ----error = TRUE--------------------------------------------------------
RSuite::prj_build()

## ----error = TRUE--------------------------------------------------------
source('R/master.R', print.eval = TRUE)

## ----comment='', echo = FALSE--------------------------------------------
dcf <- read.dcf(file = "packages/mypackage/DESCRIPTION")
dcf <- cbind(dcf, Depends = "data.table (>= 1.10.1)")
write.dcf(dcf, file = "packages/mypackage/DESCRIPTION")

cat(readLines("packages/mypackage/DESCRIPTION"), sep = "\n")

## ----error = TRUE--------------------------------------------------------
RSuite::prj_build()

## ----error = TRUE--------------------------------------------------------
RSuite::prj_install_deps()

## ----error = TRUE--------------------------------------------------------
RSuite::prj_build()

## ----message = TRUE, warning = TRUE, error = TRUE------------------------
source('R/master.R', print.eval = TRUE)

## ----comment = '', echo = FALSE------------------------------------------
writeLines(c("#' @export",
             "hello_world <- function(name) {",
             "    sprintf(\"Hello %s! Good to see you again.\", name)",
             "}"),
           con = "packages/mypackage/R/hello_world.R")

cat(readLines("packages/mypackage/R/hello_world.R"), sep = "\n")

## ----error = TRUE--------------------------------------------------------
devtools::load_all("packages/mypackage")

## ----error = TRUE--------------------------------------------------------
hello_world("John")

## ----comment = "", echo = FALSE------------------------------------------
lines <- readLines("R/master.R")
lines <- c(lines[c(1:15)],
           "",
           "#library(mypackage)",
           "",
           "#hello_world(\"Jony\")",
           "",
           "loginfo(\"Master info\")",
           "logdebug(\"Master debug\")",
           "logwarn(\"Master warning\")",
           "logerror(\"Master error\")",
           "")
writeLines(lines, con = "R/master.R")

cat(readLines("R/master.R"), sep = "\n")

## ----error = TRUE--------------------------------------------------------
source('R/master.R')

## ----comment = "", echo = FALSE------------------------------------------
writeLines("LogLevel: DEBUG", con = "config.txt")

cat(readLines("config.txt"), sep = "\n")

## ----error = TRUE--------------------------------------------------------
source('R/master.R')

## ------------------------------------------------------------------------
list.files(path = "./logs")

## ----echo = FALSE--------------------------------------------------------
log_file <- list.files(path = "./logs", pattern = "*.log", full.names = TRUE)[1]
cat(tail(readLines(log_file), n = 7), sep = "\n")

## ----comment = "", echo = FALSE------------------------------------------
writeLines(c("#' @export",
             "hello_world <- function(name) {",
             "  pkg_loginfo(\"Package info\")",
             "  pkg_logdebug(\"Package debug\")",
             "  pkg_logwarn(\"Package warning\")",
             "  pkg_logerror(\"Package error\")",
             "",
             "  sprintf(\"Hello %s! Good to see you again.\", name)",
             "}"),
           con = "packages/mypackage/R/hello_world.R")

cat(readLines("packages/mypackage/R/hello_world.R"), sep = "\n")

## ----error = TRUE--------------------------------------------------------
devtools::load_all("packages/mypackage")
hello_world("John")

## ------------------------------------------------------------------------
logging::setLevel('INFO')

## ----error = TRUE--------------------------------------------------------
RSuite::prj_lock_env()

## ----error = TRUE--------------------------------------------------------
cat(readLines("deployment/env.lock"), sep = "\n")

## ----error = TRUE--------------------------------------------------------
RSuite::prj_unlock_env()

## ----comment = "", echo = FALSE------------------------------------------
lines <- readLines("R/master.R")
lines <- c(lines[c(1:15)],
           "",
           "library(mypackage)",
           "",
           "hello_world(\"John\")",
           "")
writeLines(lines, con = "R/master.R")

cat(readLines("R/master.R"), sep = "\n")

## ----error = TRUE--------------------------------------------------------
RSuite::prj_install_deps()

## ----error = TRUE--------------------------------------------------------
RSuite::prj_build()

## ----error = TRUE--------------------------------------------------------
RSuite::prj_zip(path = tempdir())

## ----error = TRUE--------------------------------------------------------
RSuite::prj_zip(path = tempdir(), zip_ver = '1.0')

## ----error = TRUE--------------------------------------------------------
dir.create(path = file.path(tempdir(), "prod"), showWarnings = FALSE)
unzip(zipfile = file.path(tempdir(), "my_project_1.0x.zip"), 
      exdir = file.path(tempdir(), "prod"))

cat(list.files(path = file.path(tempdir(), "prod", "my_project")), sep = "\n")

## ----comment = "", echo = FALSE, error = TRUE----------------------------
cat(readLines(file.path(tempdir(), "prod", "my_project", "readme.txt")))

## ----error = TRUE--------------------------------------------------------
output <- system2(command = Sys.which("Rscript"), 
                  args = file.path(tempdir(), "prod", "my_project", "R", "master.R"),
                  stdout = TRUE)
cat(output, sep = "\n")

