library(voronoiTreemap)


### Name: vt_d3
### Title: Voronoi Treemap in an htmlwidget
### Aliases: vt_d3

### ** Examples

vt_d3(vt_export_json(vt_testdata()))
data(ExampleGDP)
gdp_json <- vt_export_json(vt_input_from_df(ExampleGDP))
vt_d3(gdp_json)
data(canada)
canada$codes <- canada$h3
canada <- canada[canada$h1=="Canada",]
canadaH <- vt_input_from_df(canada,scaleToPerc = FALSE)
vt_d3(vt_export_json(canadaH))
#without label
vt_d3(vt_export_json(canadaH), label=FALSE)
#Example with coloring from scales package
library(scales)
canada$color <- seq_gradient_pal()(exp(canada$weight)/500)
canadaH <- vt_input_from_df(canada,scaleToPerc = FALSE)
vt_d3(vt_export_json(canadaH))



