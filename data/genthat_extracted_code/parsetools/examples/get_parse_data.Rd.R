library(parsetools)


### Name: get_parse_data
### Title: Parse Data
### Aliases: get_parse_data parse-data get_parse_data.srcfile
###   get_parse_data.srcref get_parse_data.function valid_parse_data
###   as_parse_data

### ** Examples

    text <- "    my_function <- function(object #< An object to do something with
            ){
        #' A title
        #'
        #' A Description
        print(\"It Works!\")
        #< A return value.
    }"
    source(textConnection(text), keep.source = TRUE)

    # Get parse data from a function
    (pd <- get_parse_data(my_function))
    # which must have a srcref attribute.
    # You can call the get_parse data directly on the srcref object.
    src <- utils::getSrcref(my_function)
    pd2 <- get_parse_data(src)

    identical(pd, pd2)

    # Objects must have a srcref.
    utils::getSrcref(rnorm)
    tools::assertError(get_parse_data(rnorm), TRUE)



