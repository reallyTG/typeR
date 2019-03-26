library(crayon)


### Name: combine_styles
### Title: Combine two or more ANSI styles
### Aliases: combine_styles $.crayon

### ** Examples

## Use style names
alert <- combine_styles("bold", "red4", "bgCyan")
cat(alert("Warning!"), "\n")

## Or style functions
alert <- combine_styles(bold, red, bgCyan)
cat(alert("Warning!"), "\n")

## Combine a composite style
alert <- combine_styles(bold, combine_styles(red, bgCyan))
cat(alert("Warning!"), "\n")

## Shorter notation
alert <- bold $ red $ bgCyan
cat(alert("Warning!"), "\n")



