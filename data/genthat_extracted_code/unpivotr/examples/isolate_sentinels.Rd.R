library(unpivotr)


### Name: isolate_sentinels
### Title: Move sentinel values into a separate column leaving NA behind
### Aliases: isolate_sentinels

### ** Examples

x <- data.frame(name = c("Matilda", "Nicholas", "Olivia", "Paul"),
                score = c(10, "confidential", "N/A", 12),
                stringsAsFactors = FALSE)
x
isolate_sentinels(x, score, c("confidential", "N/A"))
isolate_sentinels(x, score, c("confidential", "N/A"), "flag")



