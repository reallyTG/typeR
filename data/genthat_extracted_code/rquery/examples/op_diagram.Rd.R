library(rquery)


### Name: op_diagram
### Title: Build a diagram of a optree pipeline.
### Aliases: op_diagram

### ** Examples


d <- mk_td('d',
             columns = qc(AUC, R2))
optree <- d %.>%
  extend(., v %:=% ifelse(AUC>0.5, R2, 1.0)) %.>%
  quantile_node(.) %.>%
  natural_join(., d, jointype = "LEFT", by = "AUC") %.>%
  orderby(., "AUC")

cat(format(optree))

cat(op_diagram(optree))

if(requireNamespace("DiagrammeR", quietly = TRUE)) {
  optree %.>%
    op_diagram(., merge_tables = TRUE) %.>%
    DiagrammeR::grViz(.) %.>%
    print(.)
 # # or to render to png
 # optree %.>%
 #   op_diagram(., merge_tables = TRUE) %.>%
 #   DiagrammeR::DiagrammeR(diagram = ., type = "grViz") %.>%
 #     DiagrammeRsvg::export_svg(.) %.>%
 #     charToRaw(.) %.>%
 #     rsvg::rsvg_png(., file = "diagram1.png")
}




