library(mschart)


### Name: body_add_chart
### Title: add chart into a Word document
### Aliases: body_add_chart

### ** Examples

library(officer)
my_barchart <- ms_barchart(data = browser_data,
  x = "browser", y = "value", group = "serie")
my_barchart <- chart_settings( my_barchart, grouping = "stacked",
  gap_width = 50, overlap = 100 )

## No test: 
doc <- read_docx()
doc <- body_add_chart(doc, chart = my_barchart, style = "centered")
print(doc, target = "barchart_example.docx")
## End(No test)



