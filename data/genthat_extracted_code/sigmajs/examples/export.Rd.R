library(sigmajs)


### Name: sg_export_svg
### Title: Export
### Aliases: sg_export_svg sg_export_img sg_export_img_p sg_export_svg_p

### ** Examples

nodes <- sg_make_nodes() 
edges <- sg_make_edges(nodes, 17)

sigmajs() %>% 
  sg_nodes(nodes, id, size) %>% 
  sg_edges(edges, id, source, target) %>% 
  sg_export_svg() %>% 
  sg_button("export_svg", "download")

# demo("export-graph", package = "sigmajs")




