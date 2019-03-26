library(aqp)


### Name: slab-methods
### Title: Slab-Wise Aggregation of SoilProfileCollection Objects
### Aliases: slab slab2 slab,SoilProfileCollection-method
### Keywords: methods manip

### ** Examples

##
## basic examples
##
library(lattice)
library(grid)

# load sample data, upgrade to SoilProfileCollection
data(sp1)
depths(sp1) <- id ~ top + bottom

# aggregate entire collection with two different segment sizes
a <- slab(sp1, fm = ~ prop)
b <- slab(sp1, fm = ~ prop, slab.structure=5)

# check output
str(a)

# stack into long format
ab <- make.groups(a, b)
ab$which <- factor(ab$which, levels=c('a','b'), 
labels=c('1-cm Interval', '5-cm Interval'))

# plot median and IQR
# custom plotting function for uncertainty viz.
xyplot(top ~ p.q50 | which, data=ab, ylab='Depth',
			 xlab='median bounded by 25th and 75th percentiles',
			 lower=ab$p.q25, upper=ab$p.q75, ylim=c(250,-5),
			 panel=panel.depth_function, 
			 prepanel=prepanel.depth_function,
			 cf=ab$contributing_fraction,
			 layout=c(2,1), scales=list(x=list(alternating=1))
			 )


###
### re-arrange data / no aggregation
###

# load sample data, upgrade to SoilProfileCollection
data(sp1)
depths(sp1) <- id ~ top + bottom

# arrange data by ID
a <- slab(sp1, fm = id ~ prop, slab.fun=identity)

# convert id to a factor for plotting
a$id <- factor(a$id)

# check output
str(a)

# plot via step function
xyplot(top ~ value | id, data=a, ylab='Depth',
       ylim=c(250, -5), as.table=TRUE,
       panel=panel.depth_function,
       prepanel=prepanel.depth_function,
       scales=list(x=list(alternating=1))
)


##
## categorical variable example
##
library(reshape)

# normalize horizon names: result is a factor
sp1$name <- generalize.hz(sp1$name, 
new=c('O','A','B','C'), 
pat=c('O', '^A','^B','C'))

# compute slice-wise probability so that it sums to contributing fraction, from 0-150
a <- slab(sp1, fm= ~ name, cpm=1, slab.structure=0:150)

# reshape into long format for plotting
a.long <- melt(a, id.vars=c('top','bottom'), measure.vars=c('O','A','B','C'))

# plot horizon type proportions using panels
xyplot(top ~ value | variable, data=a.long, subset=value > 0,
			 ylim=c(150, -5), type=c('S','g'), horizontal=TRUE, layout=c(4,1), col=1 )

# again, this time using groups
xyplot(top ~ value, data=a.long, groups=variable, subset=value > 0,
			 ylim=c(150, -5), type=c('S','g'), horizontal=TRUE, asp=2)

# adjust probability to size of collection, from 0-150
a.1 <- slab(sp1, fm= ~ name, cpm=2, slab.structure=0:150)

# reshape into long format for plotting
a.1.long <- melt(a.1, id.vars=c('top','bottom'), measure.vars=c('O','A','B','C'))

# combine aggregation from `cpm` modes 1 and 2
g <- make.groups(cmp.mode.1=a.long, cmp.mode.2=a.1.long)

# plot horizon type proportions
xyplot(top ~ value | variable, groups=which, data=g, subset=value > 0,
			 ylim=c(240, -5), type=c('S','g'), horizontal=TRUE, layout=c(4,1), 
			 auto.key=list(lines=TRUE, points=FALSE, columns=2),
			 par.settings=list(superpose.line=list(col=c(1,2))),
       scales=list(alternating=3))


# apply slice-wise evaluation of max probability, and assign ML-horizon at each slice
(gen.hz.ml <- get.ml.hz(a, c('O','A','B','C')))

## Not run: 
##D ##
##D ## multivariate examples
##D ##
##D data(sp3)
##D 
##D # add new grouping factor
##D sp3$group <- 'group 1'
##D sp3$group[as.numeric(sp3$id) > 5] <- 'group 2'
##D sp3$group <- factor(sp3$group)
##D 
##D # upgrade to SPC
##D depths(sp3) <- id ~ top + bottom
##D site(sp3) <- ~ group
##D 
##D # custom 'slab' function, returning mean +/- 1SD
##D mean.and.sd <- function(values) {
##D 	m <- mean(values, na.rm=TRUE)
##D 	s <- sd(values, na.rm=TRUE)
##D 	upper <- m + s
##D 	lower <- m - s
##D 	res <- c(mean=m, lower=lower, upper=upper)
##D 	return(res)
##D 	}
##D 
##D # aggregate several variables at once, within 'group'
##D a <- slab(sp3, fm=group ~ L + A + B, slab.fun=mean.and.sd)
##D 
##D # check the results:
##D # note that 'group' is the column containing group labels
##D library(lattice)
##D xyplot(
##D 	top ~ mean | variable, data=a, groups=group,
##D 	lower=a$lower, upper=a$upper, sync.colors=TRUE, alpha=0.5,
##D 	cf=a$contributing_fraction,
##D 	ylim=c(125,-5), layout=c(3,1), scales=list(x=list(relation='free')),
##D 	par.settings=list(superpose.line=list(lwd=2, col=c('RoyalBlue', 'Orange2'))),
##D 	panel=panel.depth_function, 
##D 	prepanel=prepanel.depth_function,
##D 	auto.key=list(columns=2, lines=TRUE, points=FALSE)
##D )
##D 
##D 
##D # compare a single profile to the group-level aggregate values
##D a.1 <- slab(sp3[1, ], fm=group ~ L + A + B, slab.fun=mean.and.sd)
##D 
##D # manually update the group column
##D a.1$group <- 'profile 1'
##D 
##D # combine into a single data.frame:
##D g <- rbind(a, a.1)
##D 
##D # plot with customized line styles
##D xyplot(
##D 	top ~ mean | variable, data=g, groups=group, subscripts=TRUE, 
##D 	lower=a$lower, upper=a$upper, ylim=c(125,-5),
##D 	layout=c(3,1), scales=list(x=list(relation='free')),
##D 	panel=panel.depth_function, 
##D 	prepanel=prepanel.depth_function,
##D 	sync.colors=TRUE, alpha=0.25,
##D 	par.settings=list(superpose.line=list(col=c('orange', 'royalblue', 'black'), 
##D   lwd=2, lty=c(1,1,2))),
##D 	auto.key=list(columns=3, lines=TRUE, points=FALSE)
##D )
##D 
##D 
##D 
##D ## convert mean value for each variable into long format
##D library(reshape)
##D 
##D # note that depths are no longer in order 
##D a.wide <- cast(a, group + top + bottom ~ variable, value=c('mean'))
##D 
##D ## again, this time for a user-defined slab from 40-60 cm
##D a <- slab(sp3, fm=group ~ L + A + B, slab.structure=c(40,60), slab.fun=mean.and.sd)
##D 
##D # now we have weighted average properties (within the defined slab)
##D # for each variable, and each group
##D (a.wide <- cast(a, group + top + bottom ~ variable, value=c('mean')))
##D 
##D ## this time, compute the weighted mean of selected properties, by profile ID
##D a <- slab(sp3, fm= id ~ L + A + B, slab.structure=c(40,60), slab.fun=mean.and.sd)
##D (a.wide <- cast(a, id + top + bottom ~ variable, value=c('mean')))
##D 
##D 
##D ## aggregate the entire collection, using default slab function (hdquantile)
##D ## note the missing left-hand side of the formula
##D a <- slab(sp3, fm= ~ L + A + B)
##D 
##D 
##D ## weighted-aggregation -- NOT YET IMPLEMENTED --
##D # load sample data, upgrade to SoilProfileCollection
##D data(sp1)
##D depths(sp1) <- id ~ top + bottom
##D 
##D # generate pretend weights as site-level attribute
##D set.seed(10101)
##D sp1$site.wts <- runif(n=length(sp1), min=20, max=100)
## End(Not run)



