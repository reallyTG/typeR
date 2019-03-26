library(Xmisc)


### Name: ArgumentParser-class
### Title: Parser for command-line options and arguments
### Aliases: ArgumentParser ArgumentParser-class

### ** Examples

## Test
require(Xmisc)
parser <- ArgumentParser$new()
parser$add_argument('--a_str',type='character')
parser$add_argument('--b_num',type='numeric',default='0')
a_str
## character(0)
b_num
## [1] 0
message(parser$get_help())
## Usage:
##     /bin/exec/R ...
## Description:
## Options:
##     a_str character
##     b_num numeric   [ 0 ]

## Not run: 
##D ## Test from a command line
##D R -q -e "
##D require(methods);require(Xmisc);
##D parser <- ArgumentParser\$new();
##D parser\$add_argument('--a_str',type='character');
##D parser\$add_argument('--b_num',type='numeric',default='0');
##D printme(a_str);printme(b_num);parser\$get_help();
##D " --args --a_str='Hello World!' --b_num=1
##D ## Loading required package: Xmisc
##D ## ## a_str ##
##D ## [1] "Hello World!"
##D ## ## b_num ##
##D ## [1] 1
##D ## ...
## End(Not run)



