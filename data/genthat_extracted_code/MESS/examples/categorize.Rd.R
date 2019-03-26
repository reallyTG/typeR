library(MESS)


### Name: categorize
### Title: A table function to use with magrittr pipes
### Aliases: categorize
### Keywords: manip

### ** Examples


if (requireNamespace("magrittr", quietly = TRUE)) {
    library(magrittr)

    esoph %>% categorize(alcgp, agegp)
    esoph %>% categorize(~ alcgp + agegp)
}




