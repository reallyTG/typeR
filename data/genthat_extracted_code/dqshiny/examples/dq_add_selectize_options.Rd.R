library(dqshiny)


### Name: dq_add_selectize_options
### Title: Adds selectizeOptions to a column of rhandsontable
### Aliases: dq_add_selectize_options dq_as_selectize_options

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(rhandsontable)
library(shiny)
hw <- c("Hello", "my", "funny", "world!",
  "Those", "are", "some", "really", "random", "words!")

options <- lapply(1:10, function(x) c(Name1 = sample(hw, 1),
  Name2 = sample(hw, 1), Name3 = sample(hw, 1)))
ch <- sample(hw, 3)
names(ch) <- sample(hw, 3)
selectize <- dq_as_selectize_options(ch, create = TRUE)

empty <- rep("", 10)
df <- data.frame(Unlabled=empty, Labled=empty,
  Multiple=empty, stringsAsFactors = F)

shinyApp(
  ui = fluidPage(
    dq_space(),
    rHandsontableOutput("randomTable")
  ),
  server = function(input, output) {
    output$randomTable <- renderRHandsontable({
      rhandsontable(df, stretchH = "all") %>%
        dq_add_selectize_options(NULL, 1, lapply(options, unname)) %>%
        hot_col(2, editor = "selectize", selectizeOptions = selectize) %>%
        dq_add_selectize_options(NULL, "Multiple", options, maxItems = 2)
    })
  }
)

}



