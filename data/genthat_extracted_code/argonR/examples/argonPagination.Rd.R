library(argonR)


### Name: argonPagination
### Title: Build an argon pagination container
### Aliases: argonPagination

### ** Examples

if(interactive()){
 library(argonR)
 argonPagination(
  size = "lg",
  align = "center",
  argonPaginationItem(
    name = 1,
    src = "test.html"
  ),
  argonPaginationItem(
    name = 2,
    src = "https://www.google.com"
  )
 )
}




