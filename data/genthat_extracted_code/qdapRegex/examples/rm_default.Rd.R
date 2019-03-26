library(qdapRegex)


### Name: rm_default
### Title: Remove/Replace/Extract Template
### Aliases: rm_default ex_default
### Keywords: extract sub

### ** Examples

## Built in regex dictionary
rm_default("I live in Buffalo, NY 14217", pattern="@rm_city_state_zip")

## User defined regular expression
pat <- "(\\s*([A-Z][\\w-]*)+),\\s([A-Z]{2})\\s(?<!\\d)\\d{5}(?:[ -]\\d{4})?\\b"
rm_default("I live in Buffalo, NY 14217", pattern=pat)



