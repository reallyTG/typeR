library(annotate)


### Name: blastSequences
### Title: Run a blast query to NCBI for either a string or an entrez gene
###   ID and then return a series of MultipleAlignment objects.
### Aliases: blastSequences

### ** Examples


## x can be an entrez gene ID
blastSequences(17702, timeout=40, as="data.frame")

if (interactive()) {

    ## or x can be a sequence
    blastSequences(x = "GGCCTTCATTTACCCAAAATG")

    ## hitListSize does not promise that you will get the number of
    ## matches you want..  It will just try to get that many.
    blastSequences(x = "GGCCTTCATTTACCCAAAATG", hitListSize="20")

}



