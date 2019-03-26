library(Rdpack)


### Name: append_to_Rd_list
### Title: Add content to the element of an Rd object or fragment at a
###   given position
### Aliases: append_to_Rd_list
### Keywords: RdoBuild

### ** Examples

rdoseq <- utils:::.getHelpFile(help("seq"))
iusage <- which(tools:::RdTags(rdoseq) == "\\usage")

## append a new line after the last usage line
rdoseq2 <- append_to_Rd_list(rdoseq, list(Rdo_newline()), iusage)

## Suppose that we wish to describe the function 'sequence' in the same Rd file.
## We append an usage statement for 'sequence()', without worrying about its
## actual signature.
rdoseq2 <- append_to_Rd_list(rdoseq2, list(Rdo_Rcode("sequence()")), iusage)
Rdo_show(rdoseq2)

## the two operations can be done in one step
rdoseq3 <- append_to_Rd_list(rdoseq, list(Rdo_newline(), Rdo_Rcode("sequence()")), iusage)
Rdo_show(rdoseq3)

## now run reprompt() to update rdoseq3, namely:
##    (1) it corrects the signature of 'sequence' in section \usage.
##    (2) reports new argument "nvec"
##    (3) inserts \item for the new argument(s) in section \arguments.
reprompt(rdoseq3, filename=NA)



