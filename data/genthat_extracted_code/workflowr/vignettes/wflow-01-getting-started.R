## ----decide-to-execute, cache=FALSE, echo=FALSE--------------------------
library("knitr")

# The code in this vignette requires a functional Git setup. If a workflowr user
# has a .git directory upstream of R's temporary diretory, then wflow_start will
# fail. If this situation is detected, the code is not evaluated.
if (git2r::in_repository(tempdir())) {
  opts_chunk$set(eval = FALSE)
  warning(workflowr:::wrap(
    "Because you have a Git repository upstream of R's temporary directory,
    none of the code below was executed. Please refer to the online
    documentation to see the output:
    https://jdblischak.github.io/workflowr/articles/wflow-01-getting-started.html
    \n\nYou should consider removing the directory since it was likely created
    in error: ",
    workflowr:::git2r_slot(git2r::repository(tempdir(), discover = TRUE), "path")))
}

# The code in this vignette requires pandoc. Not every CRAN server has pandoc
# installed.
if (!rmarkdown::pandoc_available()) {
  opts_chunk$set(eval = FALSE)
  message(workflowr:::wrap(
    "The code chunks below were not executed because this machine does not
    have pandoc installed."
  ))
}

## ----chunk-options, cache=FALSE, include=FALSE---------------------------
.tmp <- tempfile("wflow-01-getting-started-")
.tmp <- workflowr:::absolute(.tmp)
.project <- file.path(.tmp, "myproject")
dir.create(.project, recursive = TRUE)
opts_knit$set(root.dir = .project)

## ----load-workflowr------------------------------------------------------
library("workflowr")

## ----wflow-git-config, eval=FALSE----------------------------------------
#  # Replace the example text with your information
#  wflow_git_config(user.name = "Your Name", user.email = "email@domain")

## ----wflow-start, eval=FALSE---------------------------------------------
#  wflow_start("myproject")

## ----wflow-start-hidden, echo=FALSE--------------------------------------
setwd(.tmp)
unlink(.project, recursive = TRUE)
wflow_start("myproject", user.name = "Your Name", user.email = "email@domain")

## ----wflow-build, eval=FALSE---------------------------------------------
#  wflow_build()

## ----wflow-build-hidden, echo=FALSE--------------------------------------
# Don't want to actually open the website when building the vignette
wflow_build(view = FALSE)

## ----wflow-build-no-action-----------------------------------------------
wflow_build()

## ----wflow-view, eval=FALSE----------------------------------------------
#  wflow_view()

## ----edit-files, include=FALSE-------------------------------------------
for (f in file.path("analysis", c("index.Rmd", "about.Rmd", "license.Rmd"))) {
  cat("\nedit\n", file = f, append = TRUE)
}

## ----wflow-status--------------------------------------------------------
wflow_status()

## ----wflow-publish, eval=FALSE-------------------------------------------
#  wflow_publish(c("analysis/index.Rmd", "analysis/about.Rmd", "analysis/license.Rmd"),
#                "Publish the initial files for myproject")

## ----wflow-publish-hidden, echo=FALSE------------------------------------
# Don't want to actually open the website when building the vignette
wflow_publish(c("analysis/index.Rmd", "analysis/about.Rmd", "analysis/license.Rmd"),
              "Publish the initial files for myproject",
              view = FALSE)

## ----wflow-status-post-publish-------------------------------------------
wflow_status()

## ----wflow-remotes-------------------------------------------------------
wflow_git_remote("origin", "myname", "myproject")

## ----wflow-git-push------------------------------------------------------
wflow_git_push(dry_run = TRUE)

## ----create-file, eval=FALSE---------------------------------------------
#  wflow_open("analysis/first-analysis.Rmd")

## ----create-file-hidden, echo=FALSE--------------------------------------
# Don't want to actually open the file when building the vignette in RStudio
wflow_open("analysis/first-analysis.Rmd", edit_in_rstudio = FALSE)

## ----edit-index, include=FALSE-------------------------------------------
cat("\nClick on this [link](first-analysis.html) to see my results.\n",
    file = "analysis/index.Rmd", append = TRUE)

## ----wflow-status-newfile------------------------------------------------
wflow_status()

## ----wflow-publish-newfile, eval=FALSE-----------------------------------
#  wflow_publish(c("analysis/index.Rmd", "analysis/first-analysis.Rmd"),
#                "Add my first analysis")

## ----wflow-publish-newfile-hidden, echo=FALSE----------------------------
# Don't want to actually open the website when building the vignette
wflow_publish(c("analysis/index.Rmd", "analysis/first-analysis.Rmd"),
              "Add my first analysis", view = FALSE)

## ----republish-----------------------------------------------------------
wflow_publish("analysis/_site.yml", republish = TRUE, dry_run = TRUE)

