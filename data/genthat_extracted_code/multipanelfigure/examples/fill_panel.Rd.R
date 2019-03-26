library(multipanelfigure)


### Name: fill_panel
### Title: fill_panel
### Aliases: fill_panel addPanel addpanel add_panel

### ** Examples

## No test: 
 # Not testing - slow grid graphics makes CRAN timing excessive
# Create the figure layout
(figure <- multi_panel_figure(
  width = c(30,40,60),
  height = c(40,60,60,60),
  panel_label_type = "upper-roman"))

# Fill the top-left panel using a grob object directly
a_grob <- grid::linesGrob(arrow = grid::arrow())
figure %<>% fill_panel(a_grob)

# Add a ggplot object directly to the top row, second column.
# The panels are chosen automatically, but you can achieve the same effect
# using column = 2
a_ggplot <- ggplot2::ggplot(mtcars, ggplot2::aes(disp, mpg)) +
  ggplot2::geom_point()
figure %<>% fill_panel(a_ggplot)

# Bitmap images are added by passing the path to their file.
image_files <- system.file("extdata", package = "multipanelfigure") %>%
  dir(full.names = TRUE) %>%
  setNames(basename(.))

# Add the JPEG to the top row, third column
figure %<>% fill_panel(image_files["rhino.jpg"], column = 3)

# Add the PNG to the second and third row, first and second column
figure %<>% fill_panel(
  image_files["Rlogo.png"],
  row = 2:3, column = 1:2)

# Add the TIFF to the second row, third column
figure %<>% fill_panel(
  image_files["unicorn.svg"],
  row = 2, column = 3)

# lattice/trellis plot objects are also added directly
Depth <- lattice::equal.count(quakes$depth, number=4, overlap=0.1)
a_lattice_plot <- lattice::xyplot(lat ~ long | Depth, data = quakes)
# Add the lattice plot to the third row, third column
figure %<>% fill_panel(
  a_lattice_plot,
  row = 3, column = 3)

# Incorporate a gList object (such as produced by VennDigram)
if(requireNamespace("VennDiagram"))
{
  a_venn_plot <- VennDiagram::draw.pairwise.venn(50, 30, 20, ind = FALSE)
  # Add the Venn diagram to the fourth row, firstd column
  figure %<>% fill_panel(
    a_venn_plot,
    row = 4, column = 1)
}

# Incorporate a base plot figure
a_base_plot <- capture_base_plot(
 heatmap(
   cor(USJudgeRatings), Rowv = FALSE, symm = TRUE, col = topo.colors(16),
   distfun = function(c) as.dist(1 - c), keep.dendro = TRUE,
   cexRow = 0.5, cexCol = 0.5))
# Add the heatmap to the fourth row, second column
figure %<>% fill_panel(
  a_base_plot,
  row = 4, column = 2)

# Incorporate a ComplexHeatmap figure
require(ComplexHeatmap)
mat = matrix(rnorm(80, 2), 8, 10)
mat = rbind(mat, matrix(rnorm(40, -2), 4, 10))
rownames(mat) = letters[1:12]
colnames(mat) = letters[1:10]
ht = Heatmap(mat)
a_complex_heatmap <- ht + ht + ht
# Add the ComplexHeatmap to the fourth row, third column
(figure %<>% fill_panel(
  a_complex_heatmap,
  row = 4, column = 3))
## End(No test)



