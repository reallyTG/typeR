library(Rdpack)


### Name: parse_Rdpiece
### Title: Parse a piece of Rd source text
### Aliases: parse_Rdpiece
### Keywords: RdoProgramming

### ** Examples

# the following creates Rd object rdo
dummyfun <- function(x) x
u1 <- list_Rd(name = "Dummyname", alias = "dummyfun",
              title = "Dummy title", description = "Dummy description",
              usage = "dummyfun(x,y)",
              value = "numeric vector",
              author = "A. Author",
              Rd_class=TRUE )
fn <- tempfile("dummyfun", fileext="Rd")
reprompt(dummyfun, filename=fn)
rdo <- tools::parse_Rd(fn)

# let's prepare a new item
rd <- "\\item{...}{further arguments to be passed on.}"
newarg <- parse_Rdtext(rd, section = "\\arguments")

# now append 'newarg' to the arguments section of rdo
iarg <- which(tools:::RdTags(rdo) == "\\arguments")
rdoa <- append_to_Rd_list(rdo, newarg, iarg)

Rdo_show(rdoa)

# for arguments and other frequent tasks there are
#     specialised functions
rdob <- Rdo_append_argument(rdo, "...", "further arguments to be passed on.")


Rdo_show(reprompt(rdob))
# todo: Rdo_show(rdob) for some reason does not show the arguments.
#       investigate! Rdo_show uses Rd2txt. Is it possible that the
#       latter needs srcref's in the Rd object? They are only refreshed
#       Rd_parse is called.


unlink(fn)





