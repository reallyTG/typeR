library(Rdpack)


### Name: deparse_usage
### Title: Convert f_usage objects to text appropriate for usage sections
###   in Rd files
### Aliases: deparse_usage deparse_usage1 as.character.f_usage
### Keywords: RdoUsage

### ** Examples

cur_wd <- getwd()
setwd(tempdir())

## prepare a list of "f_usage" objects
fnseq <- reprompt(seq)            # get and save the help page of "seq"
rdoseq <- tools::parse_Rd(fnseq)  # parse the Rd file
ut <- get_usage_text(rdoseq)      # get the contents of the usage section
cat(ut, "\n")                     #     of seq() (a character string)
utp <- parse_usage_text(ut)       # parse to a list of "f_usage" objects

## deparse the "f_usage" list - each statement gets a separate string
cat(deparse_usage(utp), sep = "\n")

## explore some of the usage entries individually;
## the generic seq() has a boring signature
utp[[1]]
as.character(utp[[1]])
deparse_usage1(utp[[1]])  # same

## the default S3 method is more interesting
utp[[2]]
cat(deparse_usage1(utp[[2]]))
cat(as.character(utp[[2]]))   # same

unlink(fnseq)
setwd(cur_wd)



