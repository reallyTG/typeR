## ------------------------------------------------------------------------
library(plotscale)
library(lattice)
data("iris")

file1 <- paste0(tempfile(),'.png')
file2 <- paste0(tempfile(),'.png')

fig1 <- stripplot(
  Species~Petal.Width, data = iris,
  groups = Species, #gratuitous color 
  scales = list(y=list(rot = 90)),
  jitter.data = TRUE, factor = 5, aspect = 1)

fig2 <- stripplot(
  paste('Iris', Species)~Petal.Width, data = iris,
  groups = Species,
  xlab = 'Petal Width (cm)', ylab = 'Species',
  jitter.data = TRUE, factor = 5, aspect = 1,
  scales = list(y = list(labels = c(
        expression(italic('Iris setosa')*' Pall. ex Link'),
        expression(italic('Iris versicolor')*' L.'),
        expression(italic('Iris virginica')*' L.')))))

as.png(fig1, filename = file1, width = 2.5, height = 2.5, scaled = FALSE)
as.png(fig2, filename = file2, width = 2.5, height = 2.5, scaled = FALSE)


## ------------------------------------------------------------------------
(ps <- plotsize(fig1, width = 2.5, height = 2.5))

## ------------------------------------------------------------------------
devsize(fig1, width = ps$width, height = ps$height)

## ------------------------------------------------------------------------
width <- ps$width
height <- ps$height
file3 <- paste0(tempfile(),'.png')
file4 <- paste0(tempfile(),'.png')
as.png(fig1, filename = file3, width = width, height = height)
as.png(fig2, filename = file4, width = width, height = height)


