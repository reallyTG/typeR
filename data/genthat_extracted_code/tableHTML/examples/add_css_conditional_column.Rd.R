library(tableHTML)


### Name: add_css_conditional_column
### Title: Add conditional css to tableHTML's columns
### Aliases: add_css_conditional_column

### ** Examples


qu_25_75 <- quantile(mtcars$disp, c(0.25, 0.75))

tableHTML(mtcars) %>%
  add_css_conditional_column(conditional = "<", 
                             value = qu_25_75[1], 
                             css = list('background-color', "green"),
                             columns = c("disp")) %>%
  add_css_conditional_column(conditional = "between",
                             between = qu_25_75, 
                             css = list('background-color', "orange"), 
                             columns = c("disp")) %>%
  add_css_conditional_column(conditional = ">",
                             value = qu_25_75[2], 
                             css = list('background-color', "red"),
                             columns = c("disp"))

tableHTML(mtcars, theme = "rshiny-blue") %>%
  add_css_header(css = list(c("background-color", "color"),
                 c("darkgray", "white")), 
                 headers = 1:12) %>%
  add_css_conditional_column(conditional = "min",
                             css = list('background-color', "#99CCA0"), 
                             columns = c("wt")) %>%
  add_css_conditional_column(conditional = "max",
                             value = qu_25_75[1],
                             css = list('background-color', "#EA9393"),
                             columns = c("disp")) %>%
  add_css_conditional_column(conditional = "contains", 
                             value = "Toyota",
                              css = list(c('background-color', "color"), 
                                         c("lightgrey", "darkred")), 
                              columns = c("rownames"))  %>%
  add_css_conditional_column(conditional = "contains",
                             value = "Mazda", 
                             css = list(c('background-color', "color"),
                                        c("steelblue", "lightgray")), 
                             columns = c("rownames")) %>%
  add_css_conditional_column(conditional = "colour_rank", 
                             colour_rank_theme = "White-Blue",
                             columns = 11)

tableHTML(mtcars, theme = "scientific") %>% 
 add_css_conditional_column(conditional = "colour_rank",
                            colour_rank_theme =  "RAG",
                            columns = 1) %>%
 add_css_conditional_column(conditional = "colour_rank",
                            colour_rank_theme = "Rainbow", 
                            columns = 5, 
                            decreasing = TRUE)

css <- make_css_colour_rank_theme(list(qsec = mtcars$qsec),
                                  colors = c('#E41A1C', '#377EB8', '#4DAF4A', 
                                             '#984EA3', '#FF7F00', '#FFFF33', 
                                             '#A65628', '#F781BF', '#999999'))

tableHTML(mtcars) %>%
  add_css_conditional_column(conditional = "colour_rank", 
                             colour_rank_theme =  "Custom", 
                             colour_rank_css = css, 
                             columns = 7, 
                             decreasing = FALSE,
                             same_scale = FALSE)
  
tableHTML(mtcars) %>%
  add_css_conditional_column(conditional = "colour_rank",
                             colour_rank_theme = "RAG",
                             columns = c(1, 5)) %>%
  add_css_conditional_column(conditional = "colour_rank",
                             colour_rank_theme = "White-Blue",
                             columns = c(8, 11),
                             same_scale = TRUE) %>%
  add_css_conditional_column(conditional = "colour_rank", 
                             colour_rank_theme = "White-Red",
                             columns = c(9, 10),
                             same_scale = FALSE)




