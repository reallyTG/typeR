library(veccompare)


### Name: render.venn.diagram
### Title: Render (Print) a Previously-Computed Venn Diagram
### Aliases: render.venn.diagram

### ** Examples

# Create comparisons across 5 vectors, specifically creating all 4-way venn diagrams from them:
example <- veccompare::compare.vectors(
  veccompare::example.vectors.list[1:5],
  draw_venn_diagrams = TRUE,
  suppress_messages = TRUE,
  degrees_of_comparison_to_include = 4
)

# Get the first 4-way comparison that includes a diagram:
diagram <- veccompare::extract.compared.vectors(
  example,
  degrees_of_comparison = 4,
  elements_of_output = "venn_diagram"
)[[1]]$venn_diagram

# Print the diagram:
veccompare::render.venn.diagram(
  diagram,
  viewport_npc_width_height_for_images = .7
     # Scale the image down to 70%,
     # in case it otherwise gets cut off at the margins.
)



