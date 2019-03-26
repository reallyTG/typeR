# test -- render()

library(spup)
library(magrittr)
library(whisker)

# render table
my_template <- c(
     "| x | y |",
     "|---|---|",
     "{{#MY_TABLE}}",
     "| {{X}} | {{Y}} |",
     "{{/MY_TABLE}}")
my_table <- data.frame(X = 1:5, Y = letters[1:5])
my_table
my_template %>%
  render(MY_TABLE = unname(rowSplit(my_table))) %>%
cat