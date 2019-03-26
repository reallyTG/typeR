## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "centre",
  eval = TRUE,
  echo = TRUE,
  out.width=700)
library(taipan)

## ---- eval = FALSE-------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("srkobakian/taipan")

## ----packages------------------------------------------------------------
# load packages
library(shiny)
library(taipan)

## ----questions-----------------------------------------------------------
# create questions to ask users
questions <- taipanQuestions(
  scene = div(radioButtons("graphic", label = ("2D Graphic"),
                           choices = list("Live image", "2D Graphic")),
              radioButtons("bg", label = ("Background"),
                           choices = list("Crowd",
                                          "Court", "Logo wall", "Not applicable")),
              radioButtons("person", label = ("Detectable Person"),
                           choices = list("Yes", "No"), selected = "Yes"),
              radioButtons("shotangle", label = ("Shot angle"),
                           choices = list("Level with players",
                                          "Birds eye",
                                          "Upward angle")),
              radioButtons("situation", label = ("Situation"),
                           choices = list("Court in play",
                                          "Court player close-up",
                                          "Court close-up not player",
                                          "Crowd",
                                          "Off court close up of player",
                                          "Transition"))),
  selection = div(radioButtons("detect", label = ("Detect Face"),
                               choices = list("Player" ,
                                              "Other staff on court", "Fan", "None")),
                  radioButtons("obscured", label = ("Face obscured"),
                               choices = list("Yes", "No"), selected = "No"),
                  radioButtons("lighting", label = ("Lighting"),
                               choices = list("Direct sunlight", "Shaded", "Partially shaded")),
                  radioButtons("headangle", label = ("Head angle"),
                               choices = list("Front on", "Back of head",
                                              "Profile", "Other")),
                  radioButtons("glasses", label = ("Glasses"),
                               choices = list("Yes", "No"), selected = "No"),
                  radioButtons("visorhat", label = ("Visor/hat"),
                               choices = list("Yes", "No")))
)


## ----build, eval = FALSE-------------------------------------------------
#  images <-
#    c("https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/blue_player.png",
#    "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/pink_player.png",
#    "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/red_player.png",
#    "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/yellow_player.png",
#    "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/disgruntled_player.png")
#  
#  
#  buildTaipan(
#    questions = questions,
#    images = images,
#    file.path(tempdir(), "taipan")
#  )

## ----echo=FALSE, dpi=150, fig.cap="Taipan application scene questions."----
knitr::include_graphics("taipan_scene.png")

## ----echo=FALSE, dpi=150, fig.cap="Taipan application selection questions appear when selecting an area."----
knitr::include_graphics("taipan_make_selection.png")

## ----echo=FALSE, dpi=150, fig.cap="Taipan application selection questions can be answered for multiple selections."----
knitr::include_graphics("taipan_save_selection.png")

## ----preview_data, echo = TRUE-------------------------------------------
taipan_export_2018_09_04 <- read.csv("taipan-export-2018-09-04.csv")
taipan_export_2018_09_04

## ----echo=FALSE, dpi=150, fig.cap="Taipan application selection answers can be viewed and edited by double clicking within an area."----
knitr::include_graphics("taipan_edit_selection.png")

