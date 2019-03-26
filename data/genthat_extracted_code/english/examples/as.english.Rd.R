library(english)


### Name: as.english
### Title: Generic functions and methods for S3 class english
### Aliases: as.english english english.numeric english.default
###   english.english [.english rep.english format.english
### Keywords: arith

### ** Examples

english(1010, UK = FALSE)
english(1010, UK = TRUE)
## The default UK setting will depend on the locale:
cat("\n", ifelse(grepl("^(en_us|english_united)",
    tolower(Sys.getlocale("LC_CTYPE"))), "USA", "UK"),
    "English is your default\n")
english(101)       ## UK not given: deduced from locale
as.english(10001001) + (-5):5



