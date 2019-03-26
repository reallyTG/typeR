library(Rdpack)


### Name: parse_Rdname
### Title: Parse the name section of an Rd object
### Aliases: parse_Rdname
### Keywords: RdoProgramming

### ** Examples

u1 <- list_Rd(name = "Dummyname", alias = "Dummyallias1",
              title = "Dummy title", description = "Dummy description",
              Rd_class=TRUE )

parse_Rdname(u1)

u2 <- list_Rd(name = "dummyclass-class", alias = "Dummyclass",
              title = "Class dummyclass",
              description = "Objects and methods for something.",
              Rd_class=TRUE )

parse_Rdname(u2)



