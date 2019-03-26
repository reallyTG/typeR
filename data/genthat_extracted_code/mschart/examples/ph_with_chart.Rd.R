library(mschart)


### Name: ph_with_chart
### Title: add chart into a PowerPoint slide
### Aliases: ph_with_chart ph_with_chart_at

### ** Examples

my_barchart <- ms_barchart(data = browser_data,
  x = "browser", y = "value", group = "serie")
my_barchart <- chart_settings( x = my_barchart,
  dir="vertical", grouping="clustered", gap_width = 50 )
my_barchart <- chart_ax_x( x= my_barchart,
  cross_between = 'between', major_tick_mark="out")
my_barchart <- chart_ax_y( x= my_barchart,
  cross_between = "midCat", major_tick_mark="in")

## No test: 
library(officer)
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- ph_with_chart(doc, chart = my_barchart)

print(doc, target = "barchart_example.pptx")
## End(No test)



