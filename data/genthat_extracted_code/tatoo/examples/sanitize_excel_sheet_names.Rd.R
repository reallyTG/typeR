library(tatoo)


### Name: sanitize_excel_sheet_names
### Title: Sanitize excel sheet names
### Aliases: sanitize_excel_sheet_names

### ** Examples


sanitize_excel_sheet_names(
  c("a very: long : vector? containing some illegal characters",
    "a very: long : vector? containing some illegal characters")
)

  # [1] "a very_ long  vector_ containi0" "a very_ long  vector_ containi1"



