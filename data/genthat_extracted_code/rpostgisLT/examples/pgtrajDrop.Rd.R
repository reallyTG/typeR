library(rpostgisLT)


### Name: pgtrajDrop
### Title: Delete a pgtraj/unused rows from a traj schema.
### Aliases: pgtrajDrop

### ** Examples

## Not run: 
##D   # drop "ibex" pgtraj in schema "traj"
##D   pgtrajDrop(conn, "ibex")
##D   
##D   # clean "traj" schema by deleting all unused rows in "relocation" table
##D   pgtrajDrop(conn)
## End(Not run)



