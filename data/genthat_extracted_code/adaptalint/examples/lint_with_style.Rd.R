library(adaptalint)


### Name: lint_with_style
### Title: Lint a file, using a known style
### Aliases: lint_with_style

### ** Examples

# Get a copy of the profile of lints from the purrr package
data("style_purrr")

# Get the path to a file to check
path <- system.file("extdata", 'styles.R', package='adaptalint')

# Check this file against the lint profile of purrr
lint_with_style(filename = path, style = style_purrr)



