## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  if(!require(devtools)) {
#  install.packages("devtools")
#  }
#  
#  devtools::install_github("jooyoungseo/mboxr")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages('mboxr')

## ----test, eval=F--------------------------------------------------------
#  library(mboxr)
#  # Importing your mbox file into an R:
#  test <- system.file("extdata", "test1.mbox", package = "mboxr")
#  data <- read_mbox(test)
#  str(data)
#  #> Classes 'tbl_df', 'tbl' and 'data.frame':    2 obs. of  5 variables:
#  #>  $ date   : chr  "Fri Jul  8 12:08:34 2011" "Fri Jul  8 12:08:34 2011"
#  #>  $ from   : chr  "author@example.com" "author@example.com"
#  #>  $ to     : chr  "recipient@example.com" "recipient@example.com"
#  #>  $ subject: chr  "Sample message 1" "Sample message 2"
#  #>  $ content: chr  "This is the body.\n>From (should be escaped).\nThere are 3 lines.\n" "This is the second body.\n"
#  
#  # Or, you can save your mbox file as a CSV file while assigning a tibble variable at the same time like below:
#  data <- read_mbox(test, "output.csv")
#  data
#  #> # A tibble: 2 x 5
#  #>   date         from       to         subject    content
#  #>   <chr>        <chr>      <chr>      <chr>      <chr>
#  #> 1 Fri Jul  8 ~ author@ex~ recipient~ Sample me~ "This is the body.\n>From ~
#  #> 2 Fri Jul  8 ~ author@ex~ recipient~ Sample me~ "This is the second body.\~
#  
#  # You can merge all mbox files in your current directory or in any specified path into one tibble and save csv file for the integrated one:
#  test_path <- system.file("extdata", package = "mboxr")
#  all_data <- merge_mbox_all(path = test_path, out = "all_merged_mbox.csv")
#  ## Find your "output.csv" file saved in your computer while freely using the imported tibble in your R session!
#  all_data
#  #> # A tibble: 4 x 5
#  #>   date         from      to         subject      content
#  #>   <chr>        <chr>     <chr>      <chr>        <chr>
#  #> 1 Fri Jul  8 ~ author@e~ recipient~ Sample mess~ "This is the body.\n>From~
#  #> 2 Fri Jul  8 ~ author@e~ recipient~ Sample mess~ "This is the second body.~
#  #> 3 Sat Jul  9 ~ author@e~ recipient~ Another sam~ "R is the best!\nLet's us~
#  #> 4 Sun Jul  10~ author@e~ recipient~ The last sa~ "This is the last message

