library(mschart)


### Name: as_bar_stack
### Title: set a barchart as a stacked barchart
### Aliases: as_bar_stack

### ** Examples

library(officer)

my_bar_stack_01 <- ms_barchart(data = browser_data, x = "browser",
  y = "value", group = "serie")
my_bar_stack_01 <- as_bar_stack( my_bar_stack_01 )

my_bar_stack_02 <- ms_barchart(data = browser_data, x = "browser",
  y = "value", group = "serie")
my_bar_stack_02 <- as_bar_stack( my_bar_stack_02, percent = TRUE,
  dir = "horizontal" )

doc <- read_pptx()
doc <- add_slide(doc,
  layout = "Title and Content", master = "Office Theme")
doc <- ph_with_chart(doc, chart = my_bar_stack_01)
print(doc, target = "bar_stack.pptx")



