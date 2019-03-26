library(argparser)


### Name: add_argument
### Title: Add an argument to a parser.
### Aliases: add_argument

### ** Examples

p <- arg_parser("A text file modifying program")

# Add a positional argument
p <- add_argument(p, "input", help="input file")

# Add an optional argument
p <- add_argument(p, "--output", help="output file", default="output.txt")

# Add a flag
p <- add_argument(p, "--append", help="append to file", flag=TRUE)

# Add multiple arguments together
p <- add_argument(p,
    c("ref", "--date", "--sort"),
    help = c("reference file", "date stamp to use", "sort lines"),
    flag = c(FALSE, FALSE, TRUE))

# Print the help message
print(p)




