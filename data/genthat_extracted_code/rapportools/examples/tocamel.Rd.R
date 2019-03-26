library(rapportools)


### Name: tocamel
### Title: CamelCase
### Aliases: tocamel

### ** Examples

tocamel("foo.bar")
    ## [1] "fooBar"

    tocamel("foo.bar", upper = TRUE)
    ## [1] "FooBar"

    tocamel(c("foobar", "foo.bar", "camel_case", "a.b.c.d"))
    ## [1] "foobar"    "fooBar"    "camelCase" "aBCD"



