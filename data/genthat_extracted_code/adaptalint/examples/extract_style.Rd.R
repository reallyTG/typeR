library(adaptalint)


### Name: extract_style
### Title: Find style of a file
### Aliases: extract_style

### ** Examples


# Get the path to a file to check
path <- system.file("extdata", 'styles.R', package='adaptalint')

# Find out the provile of lints in this package
style <- extract_style(filename = path)



