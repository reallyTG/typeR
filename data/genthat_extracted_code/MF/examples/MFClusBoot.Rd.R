library(MF)


### Name: MFClusBoot
### Title: Boostrap MF CI from clustered data
### Aliases: MFClusBoot

### ** Examples

## Not run: 
##D MFClusBoot(lesion ~ group + cluster(litter), piglung)
##D 
##D #  Bootstrapping clusters. . . . .
##D #
##D #  10000 bootstrap samples of clusters
##D #  Comparing vac to con
##D #
##D #   95% confidence interval
##D #
##D #                   observed    median      lower     upper
##D #  Equal Tailed    0.3533835 0.3630573 0.07382550 0.6567271
##D #  Highest Density 0.3533835 0.3630573 0.07262462 0.6551724
##D #
##D #  Excluded Clusters
##D #  [1] M, Q, R, B, O, V, I, C
##D 
##D MFClusBoot(lesion ~ group + cluster(litter), piglung, boot.unit = T, b = 12, B = 12)
##D 
##D #### 144 resamples to save time
##D #
##D #  Bootstrapping clusters. . . . . . . . . . . . . . . .
##D #  Bootstrapping units. . . . . . . . . . . . . . . . .
##D #
##D #  10000 bootstrap samples of clusters and units in treatment in cluster
##D #  Comparing vac to con
##D #
##D #   95% confidence interval
##D #
##D #                   observed    median         lower     upper
##D #  Equal Tailed    0.3533835 0.3714286 -0.0138888889 0.7162213
##D #  Highest Density 0.3533835 0.3714286 -0.0001472081 0.7297387
##D #
##D #  Excluded Clusters
##D #  [1] M, Q, R, B, O, V, I, C
## End(Not run)



