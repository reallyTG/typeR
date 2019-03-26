library(Rdpack)


### Name: Rdapply
### Title: Apply a function over an Rd object
### Aliases: Rdapply rattr Rdtagapply
### Keywords: RdoProgramming

### ** Examples

# create an Rd object for the sake of example
u1 <- list_Rd(name = "Dummyname", alias = "dummyfun",
              title = "Dummy title", description = "Dummy description",
              usage = "dummyfun(x)",
              value = "numeric vector",
              author = "A. Author",
              examples = "\na <- matrix(1:6,nrow=2)\na %*% t(a)\nt(a) %*% a",
              Rd_class=TRUE )

# correct R code for examples but wrong for saving in Rd files
Rdo_show(u1)

# escape percents everywhere except in comments
#  (actually, .anypercent escapes only unescaped percents)
rdo <- Rdapply(u1, Rdpack:::.anypercent, classes = "character", how = "replace")

# syntactically wrong R code for examples but ok for saving in Rd files
Rdo_show(rdo)


# Rdo2Rdf does this by default for examples and other R code,
#   so code can be kept syntactically correct while processing.
#   (reprompt() takes care of this too as it uses Rdo2Rdf for saving)

fn <- tempfile("u1", fileext="Rd")
Rdo2Rdf(u1, file = fn)

# the saved file contains escaped percents but they disappear in parsing:
file.show(fn)
Rdo_show(tools::parse_Rd(fn))

# if you think that sections should start on new lines,
# the following makes the file a little more human-friendly
#   (by inserting new lines).
## Don't show: 
# todo: additional arg. for list_Rd for this?
## End(Don't show)
u2 <- Rdpack:::.Rd_tidy(u1)
Rdo2Rdf(u2, file = fn)
file.show(fn)


unlink(fn)



