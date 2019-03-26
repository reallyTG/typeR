library(Rdpack)


### Name: get_sig_text
### Title: Produce the textual form of the signatures of available methods
###   for an S4 generic function
### Aliases: get_sig_text
### Keywords: RdoS4

### ** Examples


require("stats4") # to ensure the presence of S4 methods from
                  # at least one package other than "methods"

fn <- help("show-methods", package = "methods")
rdo <- utils:::.getHelpFile(fn)

# this will find all methods for "show" in currently loaded packages
get_sig_text(rdo)

# this will select only the ones from package "stats4"
get_sig_text(rdo, package = "stats4")

# this is also fine but need to choose
# the appropriate element of "fn" if length(fn) > 1
fn <- help("show-methods")


# this finds nothing
fn <- help("logLik-methods", package = "methods")

# this does
fn <- help("logLik-methods", package = "stats4")
rdo <- utils:::.getHelpFile(fn)

get_sig_text(rdo)
get_sig_text(rdo, package = "stats4")



