library(unpivotr)


### Name: justify
### Title: Align one set of cells with another set
### Aliases: justify

### ** Examples

header_cells <- tibble::tibble(row = c(1L, 1L, 1L, 1L),
                               col = c(3L, 5L, 8L, 10L),
                               value = LETTERS[1:4])
corner_cells <- tibble::tibble(row = c(2L, 2L, 2L, 2L),
                               col = c(1L, 4L, 6L, 9L))
justify(header_cells, corner_cells)



