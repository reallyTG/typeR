## ---- echo=FALSE---------------------------------------------------------
library(tibble)
knitr::kable(tribble(
                                  ~X,          ~Location, ~Min, ~Max,
                    "Partly cloudy.",         "Brisbane",   19,   29,
                    "Partly cloudy.", "Brisbane Airport",   18,   27,
                  "Possible shower.",       "Beaudesert",   15,   30,
                    "Partly cloudy.",        "Chermside",   17,   29,
    "Shower or two. Possible storm.",           "Gatton",   15,   32,
                  "Possible shower.",          "Ipswich",   15,   30,
                    "Partly cloudy.",    "Logan Central",   18,   29,
                     "Mostly sunny.",            "Manly",   20,   26,
                    "Partly cloudy.",    "Mount Gravatt",   17,   28,
                  "Possible shower.",            "Oxley",   17,   30,
                    "Partly cloudy.",        "Redcliffe",   19,   27
    ))

## ----eval=FALSE----------------------------------------------------------
#  tibble::tribble(
#                                    ~X,          ~Location, ~Min, ~Max,
#                      "Partly cloudy.",         "Brisbane",   19L,   29L,
#                      "Partly cloudy.", "Brisbane Airport",   18L,   27L,
#                    "Possible shower.",       "Beaudesert",   15L,   30L,
#                      "Partly cloudy.",        "Chermside",   17L,   29L,
#      "Shower or two. Possible storm.",           "Gatton",   15L,   32L,
#                    "Possible shower.",          "Ipswich",   15L,   30L,
#                      "Partly cloudy.",    "Logan Central",   18L,   29L,
#                       "Mostly sunny.",            "Manly",   20L,   26L,
#                      "Partly cloudy.",    "Mount Gravatt",   17L,   28L,
#                    "Possible shower.",            "Oxley",   17L,   30L,
#                      "Partly cloudy.",        "Redcliffe",   19L,   27L
#      )

## ---- eval = FALSE-------------------------------------------------------
#  c("Mint", "Fedora", "Debian", "Ubuntu", "OpenSUSE")

## ---- eval = FALSE-------------------------------------------------------
#  c("Mint",
#    "Fedora",
#    "Debian",
#    "Ubuntu",
#    "OpenSUSE")

## ---- eval = FALSE-------------------------------------------------------
#  data.frame(
#             X = c("Partly cloudy.", "Partly cloudy.", "Possible shower.",
#                   "Partly cloudy.", "Shower or two. Possible storm.",
#                   "Possible shower.", "Partly cloudy.", "Mostly sunny.", "Partly cloudy.",
#                   "Possible shower.", "Partly cloudy."),
#      Location = c("Brisbane", "Brisbane Airport", "Beaudesert", "Chermside",
#                   "Gatton", "Ipswich", "Logan Central", "Manly",
#                   "Mount Gravatt", "Oxley", "Redcliffe"),
#           Min = c(19, 18, 15, 17, 15, 15, 18, 20, 17, 17, 19),
#           Max = c(29, 27, 30, 29, 32, 30, 29, 26, 28, 30, 27)
#  )

## ---- eval = FALSE-------------------------------------------------------
#  iris %>%
#    head() %>%
#    dpasta()

## ---- eval = FALSE-------------------------------------------------------
#  data.frame(
#        Sepal.Length = c(5.1, 4.9, 4.7, 4.6, 5, 5.4),
#         Sepal.Width = c(3.5, 3, 3.2, 3.1, 3.6, 3.9),
#        Petal.Length = c(1.4, 1.4, 1.3, 1.5, 1.4, 1.7),
#         Petal.Width = c(0.2, 0.2, 0.2, 0.2, 0.2, 0.4),
#             Species = as.factor(c("setosa", "setosa", "setosa", "setosa", "setosa",
#                                   "setosa"))
#     )

## ---- eval = FALSE-------------------------------------------------------
#  mpg %>%
#    select(-class) %>%  #just to fit neatly on this page
#    head() %>%
#    dpasta()

## ---- eval = FALSE-------------------------------------------------------
#  tibble::tribble(
#       ~manufacturer, ~model, ~displ, ~year, ~cyl,        ~trans, ~drv, ~cty, ~hwy,  ~fl,
#              "audi",   "a4",    1.8, 1999L,   4L,    "auto(l5)",  "f",  18L,  29L,  "p",
#              "audi",   "a4",    1.8, 1999L,   4L,  "manual(m5)",  "f",  21L,  29L,  "p",
#              "audi",   "a4",      2, 2008L,   4L,  "manual(m6)",  "f",  20L,  31L,  "p",
#              "audi",   "a4",      2, 2008L,   4L,    "auto(av)",  "f",  21L,  30L,  "p",
#              "audi",   "a4",    2.8, 1999L,   6L,    "auto(l5)",  "f",  16L,  26L,  "p",
#              "audi",   "a4",    2.8, 1999L,   6L,  "manual(m5)",  "f",  18L,  26L,  "p"
#       )

## ---- eval = FALSE-------------------------------------------------------
#  iris %>%
#    head() %>%
#    dmdclip()

## ---- eval = FALSE-------------------------------------------------------
#  trib_call <- tribble_construct()

## ---- eval = FALSE-------------------------------------------------------
#  write(trib_call, file = ..your desired location..)
#  #OR
#  clipr::write_clip(trib_call) #Send it back to the clipboard.

