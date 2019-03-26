## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----templates-----------------------------------------------------------
#  library(prodigenr)
#  template_list

## ----manuscriptProj------------------------------------------------------
#  path <- tempdir()
#  setup_project("HeartDiseaseExercise", path)

## ----shell_command, echo=FALSE, eval=FALSE-------------------------------
#  # run only on computer
#  cat(paste(system(
#      paste0('cd ', path, '/HeartDiseaseExercise && tree -a -I ".git|.Rproj.user" --dirsfirst -v'),
#      intern = TRUE
#      ), collapse = '\n'),
#      file = 'file_structure.txt')

## ----file_structure, echo=FALSE, eval=TRUE, results='markup', comment=''----
cat(readLines('file_structure.txt', warn = FALSE), sep = '\n')

## ----poster_abstract_show, eval=FALSE------------------------------------
#  # you need to run these in the project's console
#  create_abstract()
#  create_poster()

## ----poster_abstract_hide, echo=FALSE------------------------------------
#  # you need to run these in the project's console
#  withr::with_dir(
#      file.path(path, "HeartDiseaseExercise"),
#      {
#          create_abstract()
#          create_poster()
#      }
#  )

## ----shell_command_doc, echo=FALSE, eval=FALSE---------------------------
#  # run only on computer
#  cat(paste(system(
#      paste0('cd ', path, '/HeartDiseaseExercise && tree -a -I ".git|.Rproj.user" --dirsfirst -v'),
#      intern = TRUE
#      ), collapse = '\n'),
#      file = 'file_structure_with_doc.txt')

## ----file_structure_with_doc, echo=FALSE, eval=TRUE, results='markup', comment=''----
cat(readLines('file_structure_with_doc.txt', warn = FALSE), sep = '\n')

