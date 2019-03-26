library(argparser)


### Name: parse_args
### Title: Parse arguments with a parser.
### Aliases: parse_args

### ** Examples

p <- arg_parser('pi')
p <- add_argument(p, "--digits",
  help="number of significant digits to print", default=7)

## Not run: 
##D # If arguments are passed from the command line,
##D # then we would use the following:
##D argv <- parse_args(p)
## End(Not run)

# For testing purposes, we can pass a character vector:
argv <- parse_args(p, c("-d", "30"))

# Now, the script runs based on the passed arguments
digits <- if (argv$digits > 22) 22 else argv$digits
print(pi, digits=digits)

## Not run: 
##D # We can also save an argument list for later use
##D saveRDS(argv, "arguments.rds")
##D 
##D # To use the saved arguments, use the --opts argument at the command line
##D #$ ./script.R --opts arguments.rds
## End(Not run) 




