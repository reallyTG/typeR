library(docopt)


### Name: docopt
### Title: Parse 'args' based on command-line interface described in 'doc'.
### Aliases: docopt

### ** Examples

"Usage: my_program.R [-hso FILE] [--quiet | --verbose] [INPUT ...]

-h --help    show this
-s --sorted  sorted output
-o FILE      specify output file [default: ./test.txt]
--quiet      print less text
--verbose    print more text" -> doc
docopt(doc, "-s --quiet")



