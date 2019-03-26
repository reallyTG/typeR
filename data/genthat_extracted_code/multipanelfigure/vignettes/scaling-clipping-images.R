## ---- setup, echo = FALSE------------------------------------------------
# options(markdown.HTML.stylesheet = "style.css")
options(rstudio.markdownToHTML = 
  function(inputFile, outputFile) {      
    require(markdown)
    markdownToHTML(inputFile, outputFile, stylesheet='style.css')   
  }
) 

## ---- figure-------------------------------------------------------------
library(multipanelfigure)
figure <- multi_panel_figure(
  width = c(1, 5),
  height = c(1, 1, 4),
  unit = "inches")
r_logo <- system.file("extdata/Rlogo.png", package = "multipanelfigure")

## ---- none, fig.height = 8, fig.width = 8--------------------------------
(figure %<>% fill_panel(r_logo))

## ---- stretch, fig.height = 8, fig.width = 8-----------------------------
(figure %<>% fill_panel(r_logo, scaling = "stretch"))

## ---- fit, fig.height = 8, fig.width = 8---------------------------------
(figure %<>% fill_panel(r_logo, scaling = "fit"))

## ---- shrink_small, fig.height = 8, fig.width = 8------------------------
(figure %<>% fill_panel(r_logo, scaling = "shrink", row = 3, column = 1))

## ---- shrink_big, fig.height = 8, fig.width = 8--------------------------
(figure %<>% fill_panel(r_logo, scaling = "shrink", row = 2:3, column = 2))

## ---- figure2, fig.height = 8, fig.width = 8-----------------------------
library(grid)
figure2 <- multi_panel_figure(
  width = rep.int(1.25, 3),
  height = rep.int(1.25, 3),
  unit = "inches")
rhino <- system.file("extdata/rhino.jpg", package = "multipanelfigure")
for(position in list(c(1, 1), c(1, 2), c(1, 3), c(2, 1), c(2, 3), c(3, 1), c(3, 2), c(3, 3)))
{
  figure2 %<>% 
    fill_panel(
      rectGrob(gp = gpar(fill = "#91A45E")), 
      row = position[1], 
      column = position[2])
}
figure2

## ---- clip_on, fig.height = 5, fig.width = 5-----------------------------
(figure2 %>% fill_panel(rhino))

## ---- clip_off, fig.height = 5, fig.width = 5----------------------------
(figure2 %>% fill_panel(rhino, panel_clip = "off"))

