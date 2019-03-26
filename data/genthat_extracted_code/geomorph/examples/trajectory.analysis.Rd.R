library(geomorph)


### Name: trajectory.analysis
### Title: Quantify and compare shape change trajectories
### Aliases: trajectory.analysis
### Keywords: analysis

### ** Examples

# Estimate trajectories from LS means in 2-factor model

data(plethodon) 
Y.gpa <- gpagen(plethodon$land)   
gdf <- geomorph.data.frame(Y.gpa, species = plethodon$species, site = plethodon$site)

TA <- trajectory.analysis(coords ~ species*site, data=gdf, iter=199)
summary(TA, angle.type = "deg")
plot(TA)

# Change order of groups

site <- as.factor(plethodon$site)
levels(site) <- c("Symp", "Allo")
gdf <- geomorph.data.frame(Y.gpa, species = plethodon$species, site = site)

TA <- trajectory.analysis(coords ~ species*site, data=gdf, iter=199)
summary(TA, angle.type = "deg")
plot(TA)

attributes(TA) # list of extractable parts

# Add Centroid size as a covariate

TA <- trajectory.analysis(f1 = coords ~ species*site, f2 = ~ Csize, data=gdf, iter=199)
summary(TA, angle.type = "deg")
plot(TA)

# Change trajectory colors in plot
plot(TA, group.cols = c("dark red", "dark blue"))

# Change size of points and lines
plot(TA, group.cols = c("dark red", "dark blue"), pt.scale=1.5)

# Motion paths represented by 5 time points per motion 

data(motionpaths)

gdf <- geomorph.data.frame(trajectories = motionpaths$trajectories,
groups = motionpaths$groups)
TA <- trajectory.analysis(f1 = trajectories ~ groups, 
traj.pts = 5, data=gdf, iter=199)
summary(TA)
plot(TA)
plot(TA, group.cols = c("dark red", "dark blue", "dark green", "yellow"), pt.scale = 1.3)
plot(TA, group.cols = c("dark red", "dark blue", "dark green", "yellow"), 
pt.seq.pattern = c("green", "gray30", "red"), pt.scale = 1.3)



