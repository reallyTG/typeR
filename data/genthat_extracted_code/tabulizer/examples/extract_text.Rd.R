library(tabulizer)


### Name: extract_text
### Title: extract_text
### Aliases: extract_text

### ** Examples

## No test: 
# simple demo file
f <- system.file("examples", "text.pdf", package = "tabulizer")

# extract all text
extract_text(f)

# extract all text from page 1 only
extract_text(f, pages = 1)

# extract text from selected area only
extract_text(f, area = list(c(209.4, 140.5, 304.2, 500.8)))

## End(No test)



