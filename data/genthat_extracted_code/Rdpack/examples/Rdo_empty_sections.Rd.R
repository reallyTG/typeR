library(Rdpack)


### Name: Rdo_empty_sections
### Title: Find or remove empty sections in Rd objects
### Aliases: Rdo_empty_sections Rdo_drop_empty
### Keywords: RdoBuild

### ** Examples

dummyfun <- function(x) x
rdo8 <- list_Rd(name = "Dummyname", alias = "dummyfun",
              title = "Dummy title", description = "Dummy description",
              usage = "dummyfun(x,y)",
              value = "numeric vector",
              author = "",
              details = "",
              note = "",
              Rd_class=TRUE )

Rdo_empty_sections(rdo8)        # "details" "note"    "author"

rdo8a <- Rdo_drop_empty(rdo8)
Rdo_empty_sections(rdo8a)       # character(0)



