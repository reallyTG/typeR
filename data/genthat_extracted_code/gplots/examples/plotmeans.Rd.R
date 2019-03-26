library(gplots)


### Name: plotmeans
### Title: Plot Group Means and Confidence Intervals
### Aliases: plotmeans
### Keywords: hplot

### ** Examples


  # show comparison with boxplot
  data(state)
  plotmeans(state.area ~ state.region)

  # show some color and mean labels
  plotmeans(state.area ~ state.region,
             mean.labels=TRUE, digits=-3,
             col="red", connect=FALSE)

  # show how to specify which means should be connected
  plotmeans(state.area ~ state.region, connect=list(1:2, 3:4),
            ccol="red", pch=7 )

  # more complicated example showing how to show an interaction
  data(esoph)
  par(las=2,                        # use perpendicular axis labels
      mar=c(10.1,4.1,4.1,2.1),      # create enough space for long x labels
      mgp=c(8,1,0)                  # move x axis legend down to avoid overlap
      )
  plotmeans(ncases/ncontrols ~ interaction(agegp , alcgp, sep ="   "),
            connect=list(1:6,7:12,13:18,19:24),
            barwidth=2,
            col="dark green",
            data=esoph,
            xlab="Age Group and Alcohol Consumption",
            ylab="# Cases / # Controls",
            main=c("Fraction of Cases for by Age and Alcohol Consumption",
                   "Ile-et-Vilaine Esophageal Cancer Study")
            )
  abline(v=c(6.5, 12.5, 18.5), lty=2)




