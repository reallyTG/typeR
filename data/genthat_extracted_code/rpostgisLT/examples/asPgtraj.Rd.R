library(rpostgisLT)


### Name: asPgtraj
### Title: Imports location data from a database table into the pgtraj
###   database model
### Aliases: asPgtraj

### ** Examples

## Not run: 
##D asPgtraj(conn, 
##D         relocations_table = c("example_data","relocations_plus"),
##D         pgtrajs = "id",
##D         animals = "animal",
##D         bursts = "burst",
##D         relocations = "geom",
##D         timestamps = "time",
##D         rids = "gid",
##D         note = "trajectories in 2015",
##D         clauses = "WHERE extract(year FROM acquisition_time) = 2015",
##D         info_cols = c("dist_to_road","land_cover","error_class")
##D         )
## End(Not run)

## Not run: 
##D asPgtraj(conn, 
##D         relocations_table = c("example_data","relocations_plus"),
##D         schema = "traj_t4",
##D         pgtrajs = "id",
##D         animals = "animal",
##D         bursts = "burst",
##D         relocations = c("x","y"),
##D         timestamps = "time",
##D         rids = "gid")
## End(Not run)



