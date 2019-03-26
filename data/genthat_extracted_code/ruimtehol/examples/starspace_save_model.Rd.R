library(ruimtehol)


### Name: starspace_save_model
### Title: Save a starspace model as a binary or tab-delimited TSV file
### Aliases: starspace_save_model

### ** Examples

data(dekamer, package = "ruimtehol")
dekamer$text <- strsplit(dekamer$question, "\\W")
dekamer$text <- lapply(dekamer$text, FUN = function(x) setdiff(x, ""))
dekamer$text <- sapply(dekamer$text, 
                       FUN = function(x) paste(x, collapse = " "))

dekamer$target <- as.factor(dekamer$question_theme_main)
codes <- data.frame(code = seq_along(levels(dekamer$target)), 
                    label = levels(dekamer$target), stringsAsFactors = FALSE)
dekamer$target <- as.integer(dekamer$target)
set.seed(123456789)
model <- embed_tagspace(x = dekamer$text, 
                        y = dekamer$target, 
                        early_stopping = 0.8,
                        dim = 10, minCount = 5)
starspace_save_model(model, file = "textspace.ruimtehol", method = "ruimtehol",
                     labels = codes)
model <- starspace_load_model("textspace.ruimtehol", method = "ruimtehol")
starspace_save_model(model, file = "embeddings.tsv", method = "tsv-data.table")

## clean up for cran
file.remove("textspace.ruimtehol")
file.remove("embeddings.tsv")



