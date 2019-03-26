library(apcf)


### Name: plot.fv_pcf
### Title: Plot PCF
### Aliases: plot.fv_pcf

### ** Examples

# it's advised against setting n_sim < 199
ds <- pat2dists(area=system.file("shapes/sim_area.shp", package="apcf"),
                pattern=system.file("shapes/sim_pat_reg.shp", package="apcf"),
                max_dist=25, n_sim=3)

# derive PCF and envelope
pcf <- dists2pcf(ds, r=0.2, r_max=25, stoyan=0.15, n_rank=1)

# a simple plot
plot(x=pcf, xlim=c(0, 20), ylim=c(0, 2.2))

# a panel of four plots
op <- par(mfrow=c(2,2), oma=c(3,3,0,0), mar=c(0,0,2,2),
          mgp=c(2,0.5,0), tcl=-0.3)
plot(pcf, xaxis='t', yaxis='o', ann=FALSE)
plot(pcf, xaxis='t', yaxis='t', ann=FALSE)
plot(pcf, xaxis='o', yaxis='o', ann=FALSE)
plot(pcf, xaxis='o', yaxis='t')
par(op)




