## ----function, eval=FALSE------------------------------------------------
#  library(highlightHTML)
#  file <- system.file('examples', 'bgtable.html',
#                      package = 'highlightHTML')
#  tags <- c("#bgred {background-color: #FF0000;}",
#    "#bgblue {background-color: #0000FF;}")
#  highlight_html(input = file,
#                 output = tempfile(fileext = ".html"),
#                 tags = tags,
#                 browse = TRUE,
#                 print = FALSE,
#                 render = FALSE)

## ----text, eval = FALSE--------------------------------------------------
#  file <- system.file('examples', 'bgtext.html', package = 'highlightHTML')
#  
#  # Change background color and text color with CSS
#  tags <- c("#bgblack {background-color: black; color: white;}",
#    "#bgblue {background-color: #0000FF; color: white;}",
#    "#colgreen {color: green;}")
#  
#  # Post-process HTML file
#  highlight_html(input = file, output = tempfile(fileext = ".html"),
#                 tags = tags, browse = TRUE, render = FALSE)

## ----symm, echo = FALSE, results = 'asis', message = FALSE---------------
library(dplyr)
library(highlightHTML)

chickwts %>%
  group_by(feed) %>%
  summarise(avg_weight = mean(weight),
            sd_weight = sd(weight)) %>%
  mutate(feed = as.character(feed)) %>%
  table_id_inject(id = c('#bggrey', '#bgblack', '#bglightred', '#textblue'), 
                conditions = c('> 270', '> 300', '> 60', '== "horsebean"'),
                variable = list('avg_weight', 'avg_weight', 'sd_weight', 'feed'),
                num_digits = 3) %>%
  knitr::kable(format = 'markdown')

## ----joss_compile, eval=FALSE--------------------------------------------
#  library(highlightHTML)
#  file <- system.file('examples', 'joss.Rmd', package = 'highlightHTML')
#  
#  tags <- c('#bgblack {background-color: black; color: white;}',
#            '#bggrey {background-color: #d3d3d3;}',
#            '#bglightred {background-color: #FF6666;}',
#            '#textblue {color: blue}')
#  
#  highlight_html(input = file, output = tempfile(fileext = ".html"),
#                 tags = tags, browse = TRUE,
#                 render = TRUE)

