library(alphabetr)


### Name: read_alphabetr
### Title: Read in alphabetr sequencing data into the binary matrix form
###   needed by bagpipe()
### Aliases: read_alphabetr

### ** Examples

## Not run: 
##D   dat <- read_alphabetr(data = "alphabetr_data.csv")
##D 
##D   # saving the alpha and beta binary matrices
##D   data_alpha <- dat$alpha
##D   data_beta  <- dat$beta
##D 
##D   # finding the cdr3 sequences of alpha_2 and beta_4 respectively
##D   cdr3_alpha2 <- dat$alpha_lib[2]
##D   cdr3_beta4  <- dat$beta_lib[4]
## End(Not run)



