library(hutils)


### Name: ngrep
### Title: Anti-grep
### Aliases: ngrep

### ** Examples

 grep("[a-h]", letters)
ngrep("[a-h]", letters)

txt <- c("The", "licenses", "for", "most", "software", "are",
"designed", "to", "take", "away", "your", "freedom",
"to", "share", "and", "change", "it.",
"", "By", "contrast,", "the", "GNU", "General", "Public", "License",
"is", "intended", "to", "guarantee", "your", "freedom", "to",
"share", "and", "change", "free", "software", "--",
"to", "make", "sure", "the", "software", "is",
"free", "for", "all", "its", "users")

 grep("[gu]", txt, value = TRUE)
ngrep("[gu]", txt, value = TRUE)




