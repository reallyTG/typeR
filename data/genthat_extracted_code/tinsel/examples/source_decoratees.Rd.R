library(tinsel)


### Name: source_decoratees
### Title: Read and Parse Decoratees from a File
### Aliases: source_decoratees

### ** Examples

# source example files
source_decoratees(tinsel_example('attributes.R'))
source_decoratees(tinsel_example('tags.R'))

# the important thing is to look at the contents
# of the example files, note the use of the special
# "#." comment
writeLines(readLines(tinsel_example('attributes.R')))
writeLines(readLines(tinsel_example('tags.R')))

# the decorator functions are not sourced,
exists('attribute')  # FALSE
exists('html_wrap')  # FALSE

# only decorated functions are sourced
print(selector1)
selector1(mtcars, 'mpg')

# format with bold tags
html_bold('make this bold')

# format with paragraph tags
html_paragraph("I'll make my report as if I told a story...")




