## ----setup, include=FALSE------------------------------------------------
# read in shiny example for output below
knitr::read_chunk(
  system.file("shiny-example", "iris-app.R", package = "shinyaframe"),
  labels = "shinyappexample", from.offset = 2, to.offset = -1
)

## ---- eval=FALSE---------------------------------------------------------
#  library(dplyr)
#  library(scales)
#  library(shinyaframe)
#  
#  names(iris) <- tolower(names(iris))
#  iris %>%
#    # scale positional data to (0,1)
#    mutate_if(is.numeric, rescale) %>%
#    # scale size data to relative percentage
#    mutate(petal.width.size = rescale(petal.width, to = c(0.5, 2))) %>%
#    aDataScene()

## ----shinyappexample, eval=FALSE-----------------------------------------
#    library(shiny)
#    library(dplyr)
#    library(scales)
#    library(shinyaframe)
#  
#    shinyApp(
#      ui = fluidPage(
#        aDataSceneOutput(
#          # attributes and child elements provided as arguments
#          # server output variable name
#          outputId = "mydatascene",
#          # add backdrop
#          environment = "",
#          # gg-aframe plot syntax
#          atags$entity(
#            # an empty string sets attributes with no additional properties
#            plot = "",
#            # sizable scale option uses polyhedra scaled for equivalent volumes
#            `scale-shape` = "sizable",
#            position = "0 1.6 -1.38",
#            atags$entity(
#              `layer-point` = "",
#              `data-binding__sepal.length`="target: layer-point.x",
#              `data-binding__sepal.width`="target: layer-point.y",
#              `data-binding__petal.length`="target: layer-point.z",
#              `data-binding__species`="target: layer-point.shape",
#              `data-binding__petal.width.size`="target: layer-point.size",
#              `data-binding__species.color`="target: layer-point.color"
#            ),
#            atags$entity(
#              `guide-axis` = "axis: x",
#              `data-binding__xbreaks` = "target: guide-axis.breaks",
#              `data-binding__xlabels` = "target: guide-axis.labels",
#              `data-binding__xtitle` = "target: guide-axis.title"
#            ),
#            atags$entity(
#              `guide-axis` = "axis: y",
#              `data-binding__ybreaks` = "target: guide-axis.breaks",
#              `data-binding__ylabels` = "target: guide-axis.labels",
#              `data-binding__ytitle` = "target: guide-axis.title"
#            ),
#            atags$entity(
#              `guide-axis` = "axis: z",
#              `data-binding__zbreaks` = "target: guide-axis.breaks",
#              `data-binding__zlabels` = "target: guide-axis.labels",
#              `data-binding__ztitle` = "target: guide-axis.title"
#            ),
#            atags$entity(
#              `guide-legend` = "aesthetic: shape",
#              `data-binding__shapetitle` = "target: guide-legend.title"
#            ),
#            atags$entity(
#              `guide-legend` = "aesthetic: size",
#              `data-binding__sizebreaks` = "target: guide-legend.breaks",
#              `data-binding__sizelabels` = "target: guide-legend.labels",
#              `data-binding__sizetitle` = "target: guide-legend.title"
#            ),
#            atags$entity(
#              `guide-legend` = "aesthetic: color",
#              `data-binding__colorbreaks` = "target: guide-legend.breaks",
#              `data-binding__colorlabels` = "target: guide-legend.labels",
#              `data-binding__colortitle` = "target: guide-legend.title"
#            ),
#            # animate the plot rotation
#            atags$other('animation', attribute = "rotation",
#                        from = "0 45 0", to = "0 405 0",
#                        dur = "10000", `repeat` = "indefinite")
#          )
#        )
#      ),
#      server = function(input, output, session) {
#        output$mydatascene <- renderADataScene({
#          names(iris) <- tolower(names(iris))
#          # Margin in (0,1) scale keeps polyhedra from sticking out of plot area
#          positional_to <- c(0.01, 0.99)
#          # convert to #RRGGBB color
#          color_scale = setNames(rainbow(3, 0.75, 0.5, alpha = NULL),
#                                 unique(iris$species))
#          iris %>%
#            # scale positional data
#            mutate_if(is.numeric, rescale, to = positional_to) %>%
#            # scale size data to relative percentage, using cube root to correct
#            # for radius->volume perception bias
#            mutate(petal.width.size = rescale(petal.width^(1/3), to = c(0.5, 2)),
#                   species.color = color_scale[species]) ->
#            iris_scaled
#  
#          # provide guide info
#          make_guide <- function (var, aes, breaks = c(0.01, 0.5, 0.99)) {
#            guide = list()
#            domain = range(iris[[var]])
#            guide[[paste0(aes, "breaks")]] <- breaks
#            guide[[paste0(aes, "labels")]] <- c(domain[1],
#                                                round(mean(domain), 2),
#                                                domain[2])
#            guide[[paste0(aes, "title")]] <- var
#            guide
#          }
#          Map(make_guide,
#              var = c("sepal.length", "sepal.width", "petal.length"),
#              aes = c("x", "y", "z")) %>%
#            # repeat radius adjustment in the guide
#            c(list(make_guide("petal.width", "size", c(0.5, 1.25, 2)^(1/3)))) %>%
#            Reduce(f = c) ->
#            guides
#          guides$shapetitle = "species"
#          guides$colortitle = "species"
#          guides$colorbreaks = color_scale
#          guides$colorlabels = names(color_scale)
#  
#          # convert data frame to list and combine with guides list
#          aDataScene(c(iris_scaled, guides))
#        })
#      }
#    )

