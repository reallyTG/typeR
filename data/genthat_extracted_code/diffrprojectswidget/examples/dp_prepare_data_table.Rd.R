library(diffrprojectswidget)


### Name: dp_prepare_data_table
### Title: function for preparing data for tabulation
### Aliases: dp_prepare_data_table

### ** Examples


library(diffrprojects)
library(diffrprojectswidget)

dp <-
diffrproject$new()$
  text_add(list(text_version_1, text_version_2))$
  text_link()$
  text_align( maxDist = 1 )

dp$text_code_regex(
  text    = 1,
  x       = "change",
  pattern = "change",
  val     = "change"
)

dp_prepare_data_table(dp)





