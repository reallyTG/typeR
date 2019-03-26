library(HiveR)


### Name: animateHive
### Title: Animate One or More 3D Hive Plots with a Handy Controller
### Aliases: animateHive
### Keywords: interactive

### ** Examples


## Not run: 
##D require("rgl")
##D require("tkrgl")
##D # Sillyness: let's draw different hives with different settings
##D # List of hives 
##D t4 <- ranHiveData(type = "3D", nx = 4)
##D t5 <- ranHiveData(type = "3D", nx = 5)
##D t6 <- ranHiveData(type = "3D", nx = 6)
##D myhives <- list(t4, t5, t6)
##D # List of arguments to plot in different coordinate systems
##D cmd1 <- list(method = "abs", LA = TRUE, dr.nodes = FALSE, ch = 10)
##D cmd2 <- list(method = "rank", LA = TRUE, dr.nodes = FALSE, ch = 2)
##D cmd3 <- list(method = "norm", LA = TRUE, dr.nodes = FALSE, ch = 0.1)
##D mycmds <- list(cmd1, cmd2, cmd3)
##D #
##D animateHive(hives = myhives, cmds = mycmds)
## End(Not run)





