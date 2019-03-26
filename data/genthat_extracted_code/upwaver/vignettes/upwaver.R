## ----setup, include=FALSE, message=FALSE, results='hide'-----------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(message = FALSE)
# knitr::opts_chunk$set(results = 'hide')

## ------------------------------------------------------------------------
my_board_list <- upwaver::list_boards("ims-fhs", "a44fa67c5df2acc9836058ffca870d7b78b017cb")
my_board_list$count
summary(my_board_list)
summary(my_board_list$results[[1]])

## ------------------------------------------------------------------------
my_board_details <- upwaver::board_details("ims-fhs", 14351, "a44fa67c5df2acc9836058ffca870d7b78b017cb")
summary(my_board_details)

## ------------------------------------------------------------------------
my_card_list <- upwaver::list_cards("ims-fhs", 14351, "a44fa67c5df2acc9836058ffca870d7b78b017cb")
my_card_list$count
summary(my_card_list)
summary(my_card_list$results[[1]])

## ------------------------------------------------------------------------
my_storypoints <- upwaver::storypoints_and_status("ims-fhs", 14351, "a44fa67c5df2acc9836058ffca870d7b78b017cb")
my_storypoints$storypoints_status
my_storypoints$sum_storypoints

## ------------------------------------------------------------------------
# create_card_from_excel(
#   excel_file = "path_to_your_excel_file", 
#   sheet = "name_of_the_excel_sheet" or number_of_the_excel_sheet, 
#   line_number = line_nr_you_want_to_upload, 
#   organisation = "your_organisation", 
#   board_id = your_board_id, 
#   board_name = "your_board_name", 
#   token = "your_token")

## ------------------------------------------------------------------------
# for (i in 1:30) {
#   create_card_from_excel(..., line_number = i, ...)
# }

