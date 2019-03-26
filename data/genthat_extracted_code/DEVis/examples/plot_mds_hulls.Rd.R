library(DEVis)


### Name: plot_mds_hulls
### Title: Visualize multi-dimensional scaled data for all samples, with
###   group-wise metadata incorporated as colors, shapes, and convex hulls.
### Aliases: plot_mds_hulls
### Keywords: DE distance hull mds visualization

### ** Examples

## Not run: 
##D 
##D #These examples assume "Time", "Infection", and sampleType columns exist in target metadata.
##D 
##D  /*
##D   * Create a MDS plot with convex hulls drawn based on "Time" metadata.
##D   * Shapes are based on "Infection".  Compute based on data from all genes.
##D   */
##D plot_mds_hulls("mds_hull_plot.pdf", "Time", "Infection",
##D                 deOnly=FALSE, showLabel=FALSE, hullType="solid",
##D                 theme=1)
##D 
##D  /*
##D   * Create a MDS plot with convex hulls drawn based on "Time" metadata.
##D   * Shapes are based on "Infection".  Compute based on data from only
##D   * differentailly expressed genes.  Hulls drawn only as outlines.
##D   */
##D plot_mds_hulls("mds_hull_deOnly_plot.pdf", "Time", "Infection",
##D                 deOnly=TRUE, showLabel=FALSE, hullType="outline",
##D                 theme=2)
##D 
##D  /*
##D   * Create a MDS plot with convex hulls drawn based on "Time" metadata.
##D   * Shapes are based on "Infection".  Compute based on data from only
##D   * differentailly expressed genes.  Do not show samples labeled
##D   * as "mock" from "sampleType" column of target metadata.
##D   */
##D plot_mds_hulls("mds_hull_deOnly_plot.pdf", "Time", "Infection",
##D                 deOnly=TRUE, showLabel=FALSE, hullType="outline",
##D                 exclude_data=TRUE, idCol="sampleID",
##D                 excludeCol="sampleType", excludeName="mock"
##D                 theme=4)
##D 
## End(Not run)



