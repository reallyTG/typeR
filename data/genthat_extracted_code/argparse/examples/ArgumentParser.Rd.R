library(argparse)


### Name: ArgumentParser
### Title: Create a command line parser
### Aliases: ArgumentParser

### ** Examples


parser <- ArgumentParser(description='Process some integers')
parser$add_argument('integers', metavar='N', type="integer", nargs='+',
                   help='an integer for the accumulator')
parser$add_argument('--sum', dest='accumulate', action='store_const',
                   const='sum', default='max',
                   help='sum the integers (default: find the max)')
parser$print_help()
# default args for ArgumentParser()$parse_args are commandArgs(TRUE)
# which is what you'd want for an Rscript but not for interactive use
args <- parser$parse_args(c("--sum", "1", "2", "3")) 
accumulate_fn <- get(args$accumulate)
print(accumulate_fn(args$integers))



