library(cellranger)


### Name: as.cell_addr
### Title: Convert to a cell_addr object
### Aliases: as.cell_addr as.cell_addr.character as.cell_addr.ra_ref
###   as.cell_addr_v as.cell_addr_v.character as.cell_addr_v.list

### ** Examples

as.cell_addr(ra_ref())
rar <- ra_ref(2, TRUE, 5, TRUE)
as.cell_addr(rar)
## mixed reference
rar <- ra_ref(2, FALSE, 5, TRUE)
as.cell_addr(rar)
ra_ref_list <-
  list(ra_ref(), ra_ref(2, TRUE, 5, TRUE), ra_ref(2, FALSE, 5, TRUE))
as.cell_addr_v(ra_ref_list)
as.cell_addr("$D$12")
as.cell_addr("R4C3")
as.cell_addr(c("$C$4", "$D$12"))
as.cell_addr("$F2")
as.cell_addr("R[-4]C3")
as.cell_addr("F2", strict = FALSE)



