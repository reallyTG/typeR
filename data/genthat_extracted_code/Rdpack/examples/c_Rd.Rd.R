library(Rdpack)


### Name: c_Rd
### Title: Concatenate Rd objects or pieces
### Aliases: c_Rd
### Keywords: RdoBuild

### ** Examples

a1 <- char2Rdpiece("Dummyname", "name")
a2 <- char2Rdpiece("Dummyallias1", "alias")
a3 <- char2Rdpiece("Dummy title", "title")
a4 <- char2Rdpiece("Dummy description", "description")

## The following are equivalent
b1 <- c_Rd(gbRd::Rdo_empty(), list(a1), list(a2), list(a3), list(a4))
c1 <- c_Rd(gbRd::Rdo_empty(), list(a1, a2, a3, a4))
d1 <- c_Rd(gbRd::Rdo_empty(), list(a1, a2), list(a3, a4))
identical(c1, b1)
identical(c1, d1)
Rdo_show(b1)

## insert a newline
d1n <- c_Rd(gbRd::Rdo_empty(), list(a1, a2), Rdo_newline(), list(a3, a4))
str(d1n)

## When most of the arguments are character strings
## the function 'list_Rd' may be more convenient.
u1 <- list_Rd(name = "Dummyname", alias = "Dummyallias1",
              title = "Dummy title", description = "Dummy description",
              Rd_class = TRUE )



