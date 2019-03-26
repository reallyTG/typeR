library(ruimtehol)


### Name: embed_pagespace
### Title: Build a Starspace model for interest-based recommendation
### Aliases: embed_pagespace

### ** Examples

data(dekamer, package = "ruimtehol")
x <- subset(dekamer, !is.na(question_theme))
x <- strsplit(x$question_theme, ",")
x <- lapply(x, FUN=unique)
str(x)
set.seed(123456789)
model <- embed_pagespace(x, dim = 5, epoch = 5, minCount = 10, label = "__THEME__")
plot(model)
predict(model, "__THEME__MARINE __THEME__DEFENSIEBELEID")
 
pagevectors <- as.matrix(model)

mostsimilar <- embedding_similarity(pagevectors, 
                                    pagevectors["__THEME__MIGRATIEBELEID", ])
head(sort(mostsimilar[, 1], decreasing = TRUE), 3)
mostsimilar <- embedding_similarity(pagevectors, 
                                    pagevectors["__THEME__DEFENSIEBELEID", ])
head(sort(mostsimilar[, 1], decreasing = TRUE), 3)



