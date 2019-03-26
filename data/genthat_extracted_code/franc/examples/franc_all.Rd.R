library(franc)


### Encoding: UTF-8

### Name: franc_all
### Title: List of probably languages for a text
### Aliases: franc_all

### ** Examples

head(franc_all("O Brasil caiu 26 posições"))

## Provide a whitelist:
franc_all("O Brasil caiu 26 posições",
  whitelist = c("por", "src", "glg", "spa"))

## Provide a blacklist:
head(franc_all("O Brasil caiu 26 posições",
  blacklist = c("src", "glg", "lav")))



