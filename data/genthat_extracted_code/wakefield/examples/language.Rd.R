library(wakefield)


### Name: language
### Title: Generate Random Vector of Languages
### Aliases: language
### Keywords: language

### ** Examples

language(10)
pie(table(language(10000)))

lang <- wakefield::languages[sample(1:99, 6), ]
lang["prop"] <- lang[["N"]]/sum(lang[["N"]])
labs <- round(100 * lang[["prop"]], 1)
pie(lang[["prop"]], paste0(lang[["Language"]], "\n", labs, "%"))



