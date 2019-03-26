library(Rdpack)


### Name: reprompt
### Title: Update the documentation of a topic
### Aliases: reprompt
### Keywords: Rd

### ** Examples

## note: usage of reprompt() is simple.  the examples below are bulky
##       because they simulate various usage scenarios with commands,
##       while in normal usage they would be due to editing.

## change to a temporary directory to avoid clogging up user's
cur_wd <- getwd()
setwd(tempdir())

## as for prompt() the default is to save in current dir as "seq.Rd".
## the argument here is a function, reprompt finds its doc and
## updates all objects described along with `seq'.
## (In this case there is nothing to update, we have not changed `seq'.)

fnseq <- reprompt(seq)

## let's parse the saved Rd file (the filename is returned by reprompt)
rdoseq <- tools::parse_Rd(fnseq)   # parse fnseq to see the result.
Rdo_show(rdoseq)

## we replace usage statements with wrong ones for illustration.
## (note there is an S3 method along with the functions)
dummy_usage <- char2Rdpiece(paste("seq()", "\\method{seq}{default}()",
                   "seq.int()", "seq_along()", "seq_len()", sep="\n"),
                   "usage")
rdoseq_dummy <- Rdo_replace_section(rdoseq, dummy_usage)
Rdo_show(rdoseq_dummy)  # usage statements are wrong

reprompt(rdoseq_dummy, file = "seqA.Rd")
Rdo_show(tools::parse_Rd("seqA.Rd"))  # usage ok after reprompt

## define function myseq() 
myseq <- function(from, to, x){
    if(to < 0) {
        seq(from = from, to = length(x) + to)
    } else seq(from, to)
}

## we wish to describe  myseq() along with seq();
##    it is sufficient to put myseq() in the usage section
##    and let reprompt() do the rest
rdo2 <- Rdo_modify_simple(rdoseq, "myseq()", "usage")
reprompt(rdo2, file = "seqB.Rd")  # updates usage of myseq

## show the rendered result:
Rdo_show(tools::parse_Rd("seqB.Rd"))

## Run this if you wish to see the Rd file:
##   file.show("seqB.Rd")

reprompt(infile = "seq.Rd", filename = "seq2.Rd")
reprompt(infile = "seq2.Rd", filename = "seq3.Rd")

## Rd objects for installed help may need some tidying for human editing.
hseq_inst <- help("seq")
rdo <- utils:::.getHelpFile(hseq_inst)
rdo
rdo <- Rdpack:::.Rd_tidy(rdo)          # tidy up (e.g. insert new lines
                                       #          for human readers)
reprompt(rdo) # rdo and rdoseq are equivalent
all.equal(reprompt(rdo), reprompt(rdoseq)) # TRUE

## clean up 
unlink("seq.Rd")         # remove temporary files
unlink("seq2.Rd")
unlink("seq3.Rd")
unlink("seqA.Rd")
unlink("seqB.Rd")

setwd(cur_wd)            # restore user's working directory



